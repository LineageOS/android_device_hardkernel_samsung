#
# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

ifeq ($(TARGET_BOARD_PLATFORM),exynos4)

ifeq ($(BOARD_CAMERA),odroidpc)
	common_exynos4_camera :=libcamera_pc
endif
ifeq ($(BOARD_CAMERA),odroida4)
	common_exynos4_camera :=libcamera_a4
endif
ifeq ($(BOARD_CAMERA),odroid_a)
	common_exynos4_camera :=libcamera_a
endif
ifeq ($(BOARD_CAMERA),etri)
	common_exynos4_camera :=libcamera_etri
endif

common_exynos4_dirs := libgralloc_ump libhdmi libfimc libhwcomposer libhwconverter libswconverter libswscaler 
exynos4210_dirs := $(common_exynos4_dirs) libs5pjpeg libfimg3x $(common_exynos4_camera)

ifeq ($(BOARD_CAMERA),odroidq)
#ifeq ($(CAMERA_USE_DIGITALZOOM), true)
	common_exynos4_camera := libcamerazoom_q
#else
#	common_exynos4_camera := libcamera_q
#endif

else ifeq ($(BOARD_CAMERA),odroidx)
	common_exynos4_camera := libcamerazoom_x
endif



exynos4x12_dirs := $(common_exynos4_dirs) libhwjpeg libfimg4x $(common_exynos4_camera)
ifeq ($(TARGET_SOC),exynos4210)
  include $(call all-named-subdir-makefiles,$(exynos4210_dirs))
else
  include $(call all-named-subdir-makefiles,$(exynos4x12_dirs))
endif

endif
