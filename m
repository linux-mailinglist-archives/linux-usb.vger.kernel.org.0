Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13BC2107514
	for <lists+linux-usb@lfdr.de>; Fri, 22 Nov 2019 16:42:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbfKVPmj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Nov 2019 10:42:39 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40199 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbfKVPmi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Nov 2019 10:42:38 -0500
Received: by mail-pf1-f195.google.com with SMTP id r4so3646245pfl.7
        for <linux-usb@vger.kernel.org>; Fri, 22 Nov 2019 07:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=SwagdXY9eh89SodxsPycjtV9YB8vZHnxf/qAkOiHXOI=;
        b=rB1YCOFwHEGfN8WE2vhhVRUAIYfXMvaCQGSTj/mjwOGOny6uJx8qToJHpJaxJUeTQH
         YY+LxQ3YQ4vXCMHSqh2H7tyXkjUbjqh4vFAoKocuyKjUY05lD/QyQvA5uKLBjoUScveN
         NsKA+SJ65lg8ddGfVfRbr+8ATt1zp7jxpIablOUUeXdpGoJSvpg9VU5gcipzRvwh1bPz
         TZn64qopHqKOAATOiFDZG2YMlD8lXGRepQx1Z3hsc4ykMTWEsAKmVPdIcQroMgn3JbnW
         zBKE1H0kMxT6QhpEgUgWOMFjGKsEXX0lTOa070mSdtO+g+Y4NvX7gXBbIGB6F4X2rgm5
         TkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=SwagdXY9eh89SodxsPycjtV9YB8vZHnxf/qAkOiHXOI=;
        b=IvrhaH+FKP9qQZq33PfvQAxhpuPZaLpfcba3s3go+DW+M36RWkcKytWr3d5UMB0vgi
         vKMgs93Gv0aRG5Sk0JOVsYyEZWd3S9ApxhVYiKCJ2b9NMp6FPmusbU/qO4PmWGn67zyS
         ba2t6Oz5+sTiJIG3QhEU1HSy38qLtkZo5M4hRBcl7mRMxiLTvy1KbctSVzKzvkDkFMvU
         Wm8E9wDzCNA55VaoHNw2QkS6w7S1QzxcYGA8f+0OqVS+gWigFemDb8n/jX1dlNWRVKZk
         +Np+hao6evJozB/Lvye05oaYiI3Nj3/8j3NhEPbAPAFat/SDRCqxloPURMi3DRRw/FLs
         AYfg==
X-Gm-Message-State: APjAAAUBgHKsx6U3+gFN6/gHQieDajMo+id1PWHLxOCmHcEVaLzhMhvI
        hGw1ASAzzJjc57TO1K0eGaJlb37CfvQv2xLNx9YfRNCf
X-Google-Smtp-Source: APXvYqw5PiDEC0s7cEyxwWnXbKQns+eCgoDxC6Rlaq+s3EsMhS/fcP9v7UjLQ/JaxrOTQe+7h90sdHHQOvrT1AUjzsg=
X-Received: by 2002:a63:1f08:: with SMTP id f8mr16862798pgf.145.1574437357526;
 Fri, 22 Nov 2019 07:42:37 -0800 (PST)
MIME-Version: 1.0
From:   Bryan Gillespie <rpgillespie6@gmail.com>
Date:   Fri, 22 Nov 2019 10:42:26 -0500
Message-ID: <CAPVsg6KP3S78CyL1BhNOXfUq13te2ce1E1Oi+W2CvXfLZcRPFw@mail.gmail.com>
Subject: Debugging usb core/xhci issue
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

My name is Bryan Gillespie (RPGillespie6 on GitHub). I'm emailing
because I'm completely stumped at how to approach debugging a
USB-related issue on an embedded linux setup and I'm hoping someone
here might be able to at least be able to give some high level ideas
on how to approach debug. Also, I've never used mailing lists before
so let me know if this is completely out of line.

Basically, I have a marvell a3700 soc running embedded linux (linux
version 4.4) connected to a Qualcomm modem (linux version 3.18) via
USB 3.0 traces on a PCB. The Qualcomm modem enumerates as a devices in
the a3700 with 6 interfaces and 14 endpoints. There are various
drivers that are applied to the usb interfaces, from qcserial to
qmi_wwan, to adb (userspace), to ipcrtr (normally not a usb driver but
has usb xprt added).

Everything seems to work perfectly fine until I start putting the
system under higher load for longer periods of time. For example, if I
run iperf traffic through the qmi_wwan/usbnet interface (20 MB up, 200
MB down) and send control traffic periodically through ipc router
interface, eventually (~1-3 hours) there is some kind of breakage and
nothing usb-related works anymore for that device. Not even adb works
even though it has its own dedicated interface (adb shell just hangs
indefinitely, for example).

**This leads me to believe something in linux's usbcore or xhci
somehow got foobared by an interface driver since those are the common
layers shared by all usb interfaces?**

I don't understand these layers well enough to know what that could
possibly be. I should also mention that sometimes (not always) there
is a single dmesg trace that happens at the time of breakage in the
a3700:

[ 3771.097658] ipcrtr_read_cb Connection Reset 7 urb status -71

ipcrtr_read_cb is the urb complete callback and -71 is the feared
-EPROTO urb code.

If I issue USBDEVFS_RESET to the device with ioctl inside the a3700,
everything starts magically working again (presumably because all the
data structures/buffers/etc. in xhci and above are reset and all the
interfaces are re-probed?). I am pretty sure (but not positive) it is
not the modem's fault since qualcomm's provided reference processor
seems to be able to run iperf traffic indefinitely.

I should mention that the a3700 processor is very limited on memory;
it only has about 160 MB of total memory (DRAM) available to linux
compared to Qualcomm's reference processor which has 4 GB memory (and
is running linux version 3.10).

If you've made it this far in my email, my question is - how would you
approach debugging this? Are there some key things you would check?
Are there any known gotchas with linux 4.X as host and linux 3.X as
device? It is not easily reproducible (at least not without waiting a
long time - currently exploring if it is possibly to cause the issue
faster somehow). I have ftrace enabled, but so far I haven't been able
to get a trace that captures the exact window of breakage. I tried
turning on all usb-related debug with dynamic debug as well, but this
appears to cause the kernel to consume 100% cpu as soon as I start
iperf so currently I'm trying to identify some key files to turn on
traces for that hopefully won't overwhelm the cpu with logging.

Any recommendations/ideas at all would be much appreciated.

Thank you!

Respectfully,
Bryan

-- 
Bryan Gillespie
(801) 664-7527
