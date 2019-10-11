Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB6ED404C
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 15:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728440AbfJKNAS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 09:00:18 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44674 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728435AbfJKNAS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Oct 2019 09:00:18 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9BD0B5Y078621;
        Fri, 11 Oct 2019 08:00:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570798811;
        bh=GA3+gvfwQs5fCyVf/XaqMMfFjNqX1Y5P55x/YdwSbS0=;
        h=To:CC:From:Subject:Date;
        b=HxtYKrtkzD7UQohtzD1L5F5e1Z1qi1YneDgkThkeE+VDb1uvjfj8LxoQvqw+dBCj6
         YnDkBBWBRDO+gZMlVTgpqkmzljkXvcOQNTovaX7RW7WjBhmlPNV7eAfndk2qxaCOqT
         WHpFqZOH+Ctqaoolyv7Mu5tmJPMZX+rfRYUfgdTU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9BD0Bp4078866
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 11 Oct 2019 08:00:11 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 11
 Oct 2019 08:00:11 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 11 Oct 2019 08:00:11 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9BD09ex110123;
        Fri, 11 Oct 2019 08:00:10 -0500
To:     <laurent.pinchart@ideasonboard.com>, <paul.elder@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>
From:   Roger Quadros <rogerq@ti.com>
Subject: how to test g_webcam
Message-ID: <7c65d743-f6cd-846b-381a-07808c6f4c5a@ti.com>
Date:   Fri, 11 Oct 2019 16:00:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I'm having a hard time to figure out how to get g_webcam working with
the tip of http://git.ideasonboard.org/uvc-gadget.git

Platform I'm using is dra7-evm with dwc3 controller.

At first things just lock up the moment I load g_webcam.

To fix the deadlock

------------------------ drivers/usb/gadget/composite.c ------------------------
index 76883ff4f5bb..b2ff1cdf9850 100644
@@ -348,8 +348,12 @@ int usb_function_deactivate(struct usb_function *function)
  
  	spin_lock_irqsave(&cdev->lock, flags);
  
-	if (cdev->deactivations == 0)
+	if (cdev->deactivations == 0) {
+		spin_unlock_irqrestore(&cdev->lock, flags);
  		status = usb_gadget_deactivate(cdev->gadget);
+		spin_lock_irqsave(&cdev->lock, flags);
+	}
+
  	if (status == 0)
  		cdev->deactivations++;

After that g_webcam probes fine.

> # modprobe g_webcam
> [   41.510915] g_webcam gadget: uvc: uvc_function_bind()
> [   41.516604] g_webcam gadget: Webcam Video Gadget
> [   41.521282] g_webcam gadget: g_webcam ready

Then,

> ./uvc-gadget -i 640x480.jpg 
> ./uvc-gadget: invalid option -- 'i'
> Invalid option '-?'
> Usage: ./uvc-gadget [options] <uvc device>
> Available options are
>  -c device      V4L2 source device
>  -h             Print this help screen and exit
>  -i image       MJPEG image

So I plugged in a USB webcam on another USB port on the EVM to get a V4L2 source.

Then,

> ./uvc-gadget -c /dev/video2
> Device /dev/video2 opened: dwc3-gadget (gadget).[  135.997771] ------------[ cut here ]------------
> [  136.006581] WARNING: CPU: 0 PID: 254 at drivers/usb/gadget/composite.c:383 usb_function_activate+0x70/0x80 [libcomposite]
> [  136.017583] Modules linked in: usb_f_uvc g_webcam usb_f_ss_lb libcomposite uvcvideo videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_common snd_usb_audio videodev snd_hwdep snd_usbmidi_lib snd_raw]
> [  136.076634] CPU: 0 PID: 254 Comm: uvc-gadget Tainted: G        W         5.4.0-rc1-00006-g0dd2ed53dd86 #488
> [  136.086416] Hardware name: Generic DRA74X (Flattened Device Tree)
> [  136.092549] [<c01128c0>] (unwind_backtrace) from [<c010cae0>] (show_stack+0x10/0x14)
> [  136.100334] [<c010cae0>] (show_stack) from [<c08b76e4>] (dump_stack+0xb4/0xd4)
> [  136.107595] [<c08b76e4>] (dump_stack) from [<c013a2f4>] (__warn+0xd0/0xf8)
> [  136.114505] [<c013a2f4>] (__warn) from [<c013a3c4>] (warn_slowpath_fmt+0xa8/0xb8)
> [  136.122031] [<c013a3c4>] (warn_slowpath_fmt) from [<bf21cef8>] (usb_function_activate+0x70/0x80 [libcomposite])
> [  136.132187] [<bf21cef8>] (usb_function_activate [libcomposite]) from [<bf28f064>] (uvc_function_connect+0x10/0x40 [usb_f_uvc])
> [  136.143676] [<bf28f064>] (uvc_function_connect [usb_f_uvc]) from [<bf28fa00>] (uvc_v4l2_open+0x54/0x68 [usb_f_uvc])
> [  136.154196] [<bf28fa00>] (uvc_v4l2_open [usb_f_uvc]) from [<bf1ef4f0>] (v4l2_open+0x74/0x104 [videodev])
> [  136.163748] [<bf1ef4f0>] (v4l2_open [videodev]) from [<c02bf5e4>] (chrdev_open+0xd8/0x1ac)
> [  136.172053] [<c02bf5e4>] (chrdev_open) from [<c02b6f3c>] (do_dentry_open+0x22c/0x40c)
> [  136.179922] [<c02b6f3c>] (do_dentry_open) from [<c02ca4b4>] (path_openat+0x2a4/0x13e8)
> [  136.187879] [<c02ca4b4>] (path_openat) from [<c02cc750>] (do_filp_open+0x6c/0xdc)
> [  136.195400] [<c02cc750>] (do_filp_open) from [<c02b844c>] (do_sys_open+0x168/0x218)
> [  136.203093] [<c02b844c>] (do_sys_open) from [<c0101000>] (ret_fast_syscall+0x0/0x54)
> [  136.210867] Exception stack(0xebe37fa8 to 0xebe37ff0)
> [  136.215942] 7fa0:                   b6f3c000 b6f68968 ffffff9c 0044c4b0 00000802 00000000
> [  136.224158] 7fc0: b6f3c000 b6f68968 0044c618 00000142 0044c860 00000000 0044c690 00000000
> [  136.232369] 7fe0: 00000142 beab08c8 b6ed4155 b6e5d746
> [  136.237443] ---[ end trace e1f69be15299b4fd ]---
> 
> [  136.242153] g_webcam gadget: uvc: UVC connect failed with -22

This is one more issue, but uvc-gadget is unaware of it looks like.

> Device /dev/video2 opened: dwc3-gadget (gadget).
> [  136.519585] g_webcam gadget: high-speed config #1: Video
> [  136.524929] g_webcam gadget: uvc: uvc_function_set_alt(0, 0)
> [  136.530612] g_webcam gadget: uvc: reset UVC Control
> [  136.535523] g_webcam gadget: uvc: uvc_function_set_alt(1, 0)
> bRequestType a1 bRequest 86 wValue 0200 wIndex 0100 wLength 0001[  136.542291] g_webcam gadget: uvc: uvc_function_set_alt(1, 0)
> 
> control request (req 86 cs 02)
> bRequestType a1 bRequest 81 wValue 0200 wIndex 0000 wLength 0001
> control request (req 81 cs 02)
> bRequestType a1 bRequest 86 wValue 0200 wIndex 0200 wLength 0001
> control request (req 86 cs 02)
> bRequestType a1 bRequest 81 wValue 0200 wIndex 0000 wLength 0001
> control request (req 81 cs 02)
> bRequestType a1 bRequest 87 wValue 0100 wIndex 0001 wLength 001a
> streaming request (req 87 cs 01)
> bRequestType 21 bRequest 01 wValue 0100 wIndex 0001 wLength 001a
> streaming request (req 01 cs 01)
> setting probe control, length = 26
> bRequestType a1 bRequest 81 wValue 0100 wIndex 0001 wLength 001a
> streaming request (req 81 cs 01)
> bRequestType a1 bRequest 87 wValue 0200 wIndex 0200 wLength 0002
> control request (req 87 cs 02)
> bRequestType a1 bRequest 81 wValue 0200 wIndex 0000 wLength 0001
> control request (req 81 cs 02)
> bRequestType a1 bRequest 87 wValue 0200 wIndex 0200 wLength 0002
> control request (req 87 cs 02)
> bRequestType a1 bRequest 81 wValue 0200 wIndex 0000 wLength 0001
> control request (req 81 cs 02)
> bRequestType a1 bRequest 87 wValue 0200 wIndex 0200 wLength 0002
> control request (req 87 cs 02)
> bRequestType a1 bRequest 81 wValue 0200 wIndex 0000 wLength 0001
> control request (req 81 cs 02)
> bRequestType a1 bRequest 87 wValue 0200 wIndex 0200 wLength 0002
> control request (req 87 cs 02)
> bRequestType a1 bRequest 81 wValue 0200 wIndex 0000 wLength 0001
> control request (req 81 cs 02)
> bRequestType a1 bRequest 87 wValue 0200 wIndex 0200 wLength 0002
> control request (req 87 cs 02)
> bRequestType a1 bRequest 81 wValue 0200 wIndex 0000 wLength 0001
> control request (req 81 cs 02)
> bRequestType a1 bRequest 87 wValue 0200 wIndex 0200 wLength 0002
> control request (req 87 cs 02)
> bRequestType a1 bRequest 81 wValue 0200 wIndex 0000 wLength 0001
> control request (req 81 cs 02)
> bRequestType a1 bRequest 87 wValue 0200 wIndex 0200 wLength 0002
> control request (req 87 cs 02)
> bRequestType a1 bRequest 81 wValue 0200 wIndex 0000 wLength 0001
> control request (req 81 cs 02)
> bRequestType a1 bRequest 87 wValue 0200 wIndex 0200 wLength 0002
> control request (req 87 cs 02)
> bRequestType a1 bRequest 81 wValue 0200 wIndex 0000 wLength 0001
> control request (req 81 cs 02)

Now after starting guvcview -d /dev/video2

> [  205.340393] g_webcam gadget: uvc: reset UVC
> 
> streaming request (req 01 cs 02)
> setting commit control, leng[  205.344662] ------------[ cut here ]------------
> th = 26
> Setting format to 0x47504a4d 640x360
> === Setting frame[  205.354897] WARNING: CPU: 1 PID: 254 at drivers/media/common/videobuf2/videobuf2-core.c:738 vb2_core_reqbufs+0x1a8/0x46c [videobuf2_common]
>  rate to 15 fps
> /dev/video2: unable to set frame rate (25).
> St[  205.373018] Modules linked in: usb_f_uvc g_webcam usb_f_ss_lb libcomposite uvcvideo videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_common snd_usb_audio videodev snd_hwdep snd_usbmidi_lib snd_r]
> arting video stream.
> [  205.437574] CPU: 1 PID: 254 Comm: uvc-gadget Tainted: G        W         5.4.0-rc1-00006-g0dd2ed53dd86 #488
> [  205.449247] Hardware name: Generic DRA74X (Flattened Device Tree)
> [  205.455380] [<c01128c0>] (unwind_backtrace) from [<c010cae0>] (show_stack+0x10/0x14)
> [  205.463165] [<c010cae0>] (show_stack) from [<c08b76e4>] (dump_stack+0xb4/0xd4)
> [  205.470428] [<c08b76e4>] (dump_stack) from [<c013a2f4>] (__warn+0xd0/0xf8)
> [  205.477337] [<c013a2f4>] (__warn) from [<c013a3c4>] (warn_slowpath_fmt+0xa8/0xb8)
> [  205.484860] [<c013a3c4>] (warn_slowpath_fmt) from [<bf270b34>] (vb2_core_reqbufs+0x1a8/0x46c [videobuf2_common])
> [  205.495125] [<bf270b34>] (vb2_core_reqbufs [videobuf2_common]) from [<bf28f2c8>] (uvcg_alloc_buffers+0xc/0x18 [usb_f_uvc])
> [  205.506254] [<bf28f2c8>] (uvcg_alloc_buffers [usb_f_uvc]) from [<bf1f5254>] (__video_do_ioctl+0x1c4/0x464 [videodev])
> [  205.516951] [<bf1f5254>] (__video_do_ioctl [videodev]) from [<bf1f70cc>] (video_usercopy+0x228/0x694 [videodev])
> [  205.527196] [<bf1f70cc>] (video_usercopy [videodev]) from [<c02cf520>] (do_vfs_ioctl+0x98/0x938)
> [  205.536023] [<c02cf520>] (do_vfs_ioctl) from [<c02cfe24>] (ksys_ioctl+0x64/0x74)
> [  205.543453] [<c02cfe24>] (ksys_ioctl) from [<c0101000>] (ret_fast_syscall+0x0/0x54)
> [  205.551141] Exception stack(0xebe37fa8 to 0xebe37ff0)
> [  205.556215] 7fa0:                   00000000 0044c5b0 00000003 c0145608 beab0774 00000002
> [  205.564431] 7fc0: 00000000 0044c5b0 00000000 00000036 00000004 beab0a90 beab0b20 beab0aa0
> [  205.572645] 7fe0: 0044b058 beab076c 00438ef7 b6edaf08
> [  205.577742] ---[ end trace e1f69be15299b4fe ]---
> /dev/video2: unable to request buffers (22).
> Failed to allocate source buffers: Invalid argument (22)

Any clues what I'm doing wrong here? Am I missing some Kconfig option?

As a sidenote, having uvc-gadget work without an external video source was great (e.g. jpg image or random video pattern).
Looks like that feature broke unintentionally?

What platform was g_webcam and uvc-gadget last tested with?

-- 
cheers,
-roger

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
