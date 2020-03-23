Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3708218F6F8
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2020 15:32:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbgCWOc5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Mar 2020 10:32:57 -0400
Received: from arashi.greysector.net ([51.68.141.79]:57526 "EHLO
        arashi.greysector.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbgCWOc5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Mar 2020 10:32:57 -0400
X-Greylist: delayed 514 seconds by postgrey-1.27 at vger.kernel.org; Mon, 23 Mar 2020 10:32:44 EDT
Received: from sakura.greysector.net (unknown [212.180.189.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by arashi.greysector.net (Postfix) with ESMTPSA id 371192595;
        Mon, 23 Mar 2020 15:24:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 arashi.greysector.net 371192595
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greysector.net;
        s=default; t=1584973449;
        bh=b8wbPxgdnNZquf2y+On7QShKcwckA6w0qTNLiMLjyYs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=m9UrIo05VbW9rTiClbZR4/neW9kqoCHfp3FbvRSI9S+dhJHRe4h402YENmMdnTAZs
         wxlGsJT1TPDE00bPX2HSSbeX5vY0jLWK7z8Qc1GZ6RPvYCnbu1qoXJMuDvYC/YP4YA
         ho4jk5x/7TWi+ooeDVC0a4IuATMqgJdfJ0BTQPGw=
Date:   Mon, 23 Mar 2020 15:24:08 +0100
From:   Dominik 'Rathann' Mierzejewski <dominik@greysector.net>
To:     linux-uvc-devel@lists.sourceforge.net
Cc:     linux-usb@vger.kernel.org
Subject: Re: [linux-uvc-devel] video corruption when capturing MJPEG from a
 Chicony device
Message-ID: <20200323142408.GB6457@sakura.greysector.net>
References: <20200319233726.GB14098@sakura.greysector.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200319233726.GB14098@sakura.greysector.net>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Cc'ing the general USB dev list, too, since I see many UVC-related
messages.

On Friday, 20 March 2020 at 00:37, Dominik 'Rathann' Mierzejewski wrote:
> Dear list,
> I'm experiencing video corruption when capturing in MJPEG format.
> There are no issues when capturing in YUV format, though. The problem
> is, one proprietary application I care about (Zoom) captures in MJPEG
> format with no option to change the format.
> 
> I'm attaching kernel log and USB descriptors according to the FAQ.
> 
> The device is a webcam made by Chicony built into a Sony Vaio Pro 13:
> 04f2:b42a Chicony Electronics Co., Ltd Front Camera
> 
> I'm running Fedora 31 with kernel-5.5.9-200.fc31.x86_64.

[...]

> Mar 18 19:06:59 kernel: uvcvideo: Found UVC 1.00 device Front Camera (04f2:b42a)
> Mar 18 19:06:59 kernel: uvcvideo 2-5:1.0: Entity type for entity Extension 4 was not initialized!
> Mar 18 19:06:59 kernel: uvcvideo 2-5:1.0: Entity type for entity Processing 2 was not initialized!
> Mar 18 19:06:59 kernel: uvcvideo 2-5:1.0: Entity type for entity Camera 1 was not initialized!
> Mar 18 19:06:59 kernel: usbcore: registered new interface driver uvcvideo
> Mar 19 18:47:02 kernel: uvcvideo: Failed to resubmit video URB (-1).
> Mar 20 00:04:28 kernel: uvcvideo: uvc_v4l2_poll
[...cut repeated lines...]
> Mar 20 00:05:06 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:06 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:06 kernel: uvcvideo: Trying format 0x47504a4d (MJPG): 1280x720.
> Mar 20 00:05:06 kernel: uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
> Mar 20 00:05:06 kernel: uvcvideo: Setting frame interval to 1/30 (333333).
> Mar 20 00:05:06 kernel: uvcvideo: Allocated 5 URB buffers of 32x512 bytes each.
> Mar 20 00:05:06 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:06 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:06 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:06 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:06 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:06 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:06 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:06 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:06 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:06 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:06 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:06 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:06 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:06 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:06 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:06 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:06 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:06 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:06 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: frame 1 stats: 0/7/7 packets, 2/6/3 pts (!early !initial), 3/4 scr, last pts/stc/sof 1080667737/1081109155/1120
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:07 kernel: uvcvideo: frame 2 stats: 0/4/4 packets, 2/2/3 pts (!early initial), 1/2 scr, last pts/stc/sof 4254895424/295053435/14593
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: frame 3 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/0 scr, last pts/stc/sof 0/0/0
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: frame 4 stats: 0/2/2 packets, 0/0/1 pts (!early !initial), 0/1 scr, last pts/stc/sof 1081671070/1082112273/1186
> Mar 20 00:05:07 kernel: uvcvideo: frame 5 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1082674404/1082781651/1231
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:07 kernel: uvcvideo: frame 6 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/0 scr, last pts/stc/sof 3045564012/0/0
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: frame 7 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/0 scr, last pts/stc/sof 3045564012/0/0
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:07 kernel: uvcvideo: frame 8 stats: 0/2/2 packets, 0/0/1 pts (!early initial), 0/0 scr, last pts/stc/sof 1905900649/0/0
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: frame 9 stats: 0/2/2 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 3876851368/3611853841/36164
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: frame 10 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1082674404/1083115394/1253
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: frame 11 stats: 0/3/3 packets, 2/2/3 pts (!early initial), 2/3 scr, last pts/stc/sof 2165387471/3194731920/7324
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: frame 12 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 3514540835/2981125202/43420
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
[...cut repeated lines...]
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: frame 13 stats: 0/3/3 packets, 1/2/2 pts (!early !initial), 2/3 scr, last pts/stc/sof 1083677737/1084118522/1320
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: frame 14 stats: 0/3/3 packets, 1/2/2 pts (!early initial), 1/2 scr, last pts/stc/sof 3553530643/3739368529/17508
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: frame 15 stats: 0/2/2 packets, 1/1/2 pts (!early initial), 0/0 scr, last pts/stc/sof 3298219740/0/0
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:07 kernel: uvcvideo: frame 16 stats: 0/2/2 packets, 0/0/1 pts (!early !initial), 0/1 scr, last pts/stc/sof 1084681071/1085121648/1387
> Mar 20 00:05:07 kernel: uvcvideo: frame 17 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1085684404/1085792898/1432
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:07 kernel: uvcvideo: frame 18 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/0 scr, last pts/stc/sof 1117563421/0/0
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:07 kernel: uvcvideo: frame 19 stats: 0/2/2 packets, 0/0/1 pts (!early initial), 0/0 scr, last pts/stc/sof 1117563421/0/0
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: frame 20 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 2036765561/2452031280/53809
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:07 kernel: uvcvideo: frame 21 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 450152333/51499414/57140
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: frame 22 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 450152333/51499414/57140
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: frame 23 stats: 0/2/2 packets, 0/0/1 pts (!early !initial), 1/2 scr, last pts/stc/sof 1085684404/1086124766/1454
> Mar 20 00:05:07 kernel: uvcvideo: frame 24 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1086687737/1086792277/1498
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:07 kernel: uvcvideo: frame 25 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/2073305673/14007
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:07 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: frame 26 stats: 0/3/3 packets, 0/0/1 pts (!early !initial), 1/2 scr, last pts/stc/sof 2278846954/602916792/57714
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: frame 27 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/0 scr, last pts/stc/sof 0/0/0
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: frame 28 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/1542608331/42640
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:07 kernel: uvcvideo: frame 29 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1086687737/1087127896/1521
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: frame 30 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1086687737/1087127896/1521
> Mar 20 00:05:07 kernel: uvcvideo: frame 31 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1087691070/1087797280/1565
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:07 kernel: uvcvideo: frame 32 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 3523820119/2393982695/27784
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: frame 33 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 3523820119/2393982695/27784
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:07 kernel: uvcvideo: frame 34 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/3430147492/18861
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: frame 35 stats: 0/2/2 packets, 0/0/1 pts (!early !initial), 1/2 scr, last pts/stc/sof 769796283/969775396/64313
> Mar 20 00:05:07 kernel: uvcvideo: frame 36 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/0 scr, last pts/stc/sof 0/0/0
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:07 kernel: uvcvideo: frame 37 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/0 scr, last pts/stc/sof 0/0/0
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:07 kernel: uvcvideo: frame 38 stats: 0/2/2 packets, 0/0/1 pts (!early !initial), 0/1 scr, last pts/stc/sof 1087691070/1088131024/1588
> Mar 20 00:05:07 kernel: uvcvideo: frame 39 stats: 0/2/2 packets, 0/0/1 pts (!early initial), 1/2 scr, last pts/stc/sof 1088694404/1335461640/20225
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:07 kernel: uvcvideo: frame 40 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 2979525220/1567986974/23246
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: frame 41 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 2979525220/1567986974/23246
> Mar 20 00:05:07 kernel: uvcvideo: frame 42 stats: 0/2/2 packets, 1/1/2 pts (!early initial), 0/1 scr, last pts/stc/sof 3867736255/1457685410/63904
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:07 kernel: uvcvideo: frame 43 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/0 scr, last pts/stc/sof 2331652098/0/0
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: frame 44 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/0 scr, last pts/stc/sof 2331652098/0/0
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: frame 45 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1088694404/1089134151/1655
> Mar 20 00:05:07 kernel: uvcvideo: frame 46 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1089697737/1089803533/1699
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:07 kernel: uvcvideo: frame 47 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 779472569/2724489321/56158
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: frame 48 stats: 0/2/2 packets, 1/1/2 pts (!early initial), 1/2 scr, last pts/stc/sof 216557142/3194446899/32005
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:07 kernel: uvcvideo: frame 49 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/2289691821/50798
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: frame 50 stats: 0/2/2 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/2289691821/50798
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: frame 51 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/0 scr, last pts/stc/sof 824431576/0/0
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:07 kernel: uvcvideo: frame 52 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1089697737/1090139151/1722
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: frame 53 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1089697737/1090139151/1722
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: frame 54 stats: 0/4/4 packets, 0/0/1 pts (!early initial), 1/2 scr, last pts/stc/sof 1090701071/3066652851/59470
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: frame 55 stats: 0/2/2 packets, 1/1/2 pts (!early initial), 0/1 scr, last pts/stc/sof 2712114081/555462424/11926
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: frame 56 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1090701071/1091140403/1788
> Mar 20 00:05:07 kernel: uvcvideo: frame 57 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1091704404/1091809789/1833
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:07 kernel: uvcvideo: frame 58 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/0 scr, last pts/stc/sof 3102026003/0/0
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: frame 59 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/0 scr, last pts/stc/sof 3102026003/0/0
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:07 kernel: uvcvideo: frame 60 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/0 scr, last pts/stc/sof 0/0/0
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: frame 61 stats: 0/2/2 packets, 0/0/1 pts (!early !initial), 0/1 scr, last pts/stc/sof 1249078485/1253103789/56583
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:07 kernel: uvcvideo: frame 62 stats: 0/2/2 packets, 0/0/0 pts (!early !initial), 0/0 scr, last pts/stc/sof 0/0/0
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: frame 63 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1091704404/1092143534/1855
> Mar 20 00:05:07 kernel: uvcvideo: frame 64 stats: 0/2/2 packets, 1/1/2 pts (!early initial), 1/2 scr, last pts/stc/sof 3240772983/1615087627/43922
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:07 kernel: uvcvideo: frame 65 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/233056466/27798
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: frame 66 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/233056466/27798
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:07 kernel: uvcvideo: frame 67 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/2612651636/43750
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:07 kernel: uvcvideo: frame 68 stats: 0/2/2 packets, 0/0/1 pts (!early !initial), 0/1 scr, last pts/stc/sof 1198305580/2612651636/43750
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: frame 69 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/0 scr, last pts/stc/sof 2451969851/0/0
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: frame 70 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1092707737/1093148539/1922
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:07 kernel: uvcvideo: frame 71 stats: 0/3/3 packets, 1/1/2 pts (!early initial), 1/2 scr, last pts/stc/sof 1513744115/1700274619/20475
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:07 kernel: uvcvideo: frame 72 stats: 0/3/3 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/1827046145/62971
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: frame 73 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1093711070/1094151669/1989
> Mar 20 00:05:07 kernel: uvcvideo: frame 74 stats: 0/2/2 packets, 0/0/1 pts (!early initial), 1/2 scr, last pts/stc/sof 1094714404/3558562323/28272
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:07 kernel: uvcvideo: frame 75 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/0 scr, last pts/stc/sof 0/0/0
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: frame 76 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/0 scr, last pts/stc/sof 0/0/0
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: frame 77 stats: 0/2/2 packets, 0/0/1 pts (!early initial), 0/0 scr, last pts/stc/sof 2423469945/0/0
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: frame 78 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/0 scr, last pts/stc/sof 1874983000/0/0
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: frame 79 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1094714404/1095154801/8
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:07 kernel: uvcvideo: frame 80 stats: 0/3/3 packets, 2/2/3 pts (!early initial), 0/1 scr, last pts/stc/sof 2128664654/1095822314/52
> Mar 20 00:05:07 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: frame 81 stats: 0/3/3 packets, 1/2/2 pts (!early !initial), 2/3 scr, last pts/stc/sof 2169243177/1161688257/58738
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:07 kernel: uvcvideo: frame 82 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1095717737/1096157932/75
> Mar 20 00:05:07 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:07 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: frame 83 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1095717737/1096157932/75
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: frame 84 stats: 0/2/2 packets, 1/1/2 pts (!early initial), 0/1 scr, last pts/stc/sof 3569820305/1096827318/119
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: frame 85 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/0 scr, last pts/stc/sof 701890815/0/0
> Mar 20 00:05:08 kernel: uvcvideo: frame 86 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/0 scr, last pts/stc/sof 0/0/0
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:08 kernel: uvcvideo: frame 87 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/0 scr, last pts/stc/sof 0/0/0
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: frame 88 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/0 scr, last pts/stc/sof 0/0/0
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:08 kernel: uvcvideo: frame 89 stats: 0/2/2 packets, 0/0/1 pts (!early !initial), 1/2 scr, last pts/stc/sof 1096721071/1097161061/142
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: frame 90 stats: 0/3/3 packets, 2/2/3 pts (!early initial), 1/2 scr, last pts/stc/sof 2509915153/207000323/41312
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:08 kernel: uvcvideo: frame 91 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/0 scr, last pts/stc/sof 1087037345/0/0
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: frame 92 stats: 0/3/3 packets, 2/2/3 pts (!early initial), 1/2 scr, last pts/stc/sof 3132381983/3371277579/14214
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:08 kernel: uvcvideo: frame 93 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1097724404/1098164194/209
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: frame 94 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1097724404/1098164194/209
> Mar 20 00:05:08 kernel: uvcvideo: frame 95 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1098727737/1098833581/253
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:08 kernel: uvcvideo: frame 96 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 124512882/3431466699/50899
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: frame 97 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 124512882/3431466699/50899
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:08 kernel: uvcvideo: frame 98 stats: 0/3/3 packets, 0/0/0 pts (!early !initial), 1/2 scr, last pts/stc/sof 0/2881076383/50339
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: frame 99 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/3175509382/57910
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: frame 100 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1098727737/1099169200/276
> Mar 20 00:05:08 kernel: uvcvideo: frame 101 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1099731070/1099836711/320
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:08 kernel: uvcvideo: frame 102 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/2239961436/48744
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: frame 103 stats: 0/2/2 packets, 0/0/1 pts (!early !initial), 0/1 scr, last pts/stc/sof 1456365130/2239961436/48744
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:08 kernel: uvcvideo: frame 104 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/0 scr, last pts/stc/sof 0/0/0
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:08 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:08 kernel: uvcvideo: frame 105 stats: 0/4/4 packets, 2/3/3 pts (!early !initial), 1/2 scr, last pts/stc/sof 1099731070/1100170453/342
> Mar 20 00:05:08 kernel: uvcvideo: frame 106 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1100734404/1100839841/387
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:08 kernel: uvcvideo: frame 107 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 3799617706/1426345149/7996
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: frame 108 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 3799617706/1426345149/7996
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:08 kernel: uvcvideo: frame 109 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 4181783523/1755205297/41837
> Mar 20 00:05:08 kernel: uvcvideo: frame 110 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 4181783523/1755205297/41837
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:08 kernel: uvcvideo: frame 111 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/0 scr, last pts/stc/sof 0/0/0
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:08 kernel: uvcvideo: frame 112 stats: 0/3/3 packets, 0/0/0 pts (!early !initial), 0/0 scr, last pts/stc/sof 0/0/0
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: frame 113 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1100734404/1101173584/409
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:08 kernel: uvcvideo: frame 114 stats: 0/3/3 packets, 1/2/2 pts (!early initial), 2/3 scr, last pts/stc/sof 1563122848/2447559954/42764
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: frame 115 stats: 0/2/2 packets, 0/0/0 pts (!early !initial), 0/0 scr, last pts/stc/sof 0/0/0
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: frame 116 stats: 0/2/2 packets, 0/0/1 pts (!early !initial), 1/2 scr, last pts/stc/sof 1101737737/1102178585/476
> Mar 20 00:05:08 kernel: uvcvideo: frame 117 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1102741071/1102846090/521
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:08 kernel: uvcvideo: frame 118 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/4164310673/15179
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: frame 119 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/4164310673/15179
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:08 kernel: uvcvideo: frame 120 stats: 0/2/2 packets, 1/1/2 pts (!early initial), 0/1 scr, last pts/stc/sof 1599338826/812860298/20686
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: frame 121 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 3950466213/2666519112/52682
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: frame 122 stats: 0/2/2 packets, 0/0/1 pts (!early !initial), 1/2 scr, last pts/stc/sof 1102741071/1103179835/543
> Mar 20 00:05:08 kernel: uvcvideo: frame 123 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1103744404/1103849222/588
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:08 kernel: uvcvideo: frame 124 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/3401260404/62181
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: frame 125 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/3401260404/62181
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:08 kernel: uvcvideo: frame 126 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/2055705025/8034
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:08 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: frame 127 stats: 0/5/5 packets, 2/4/3 pts (!early !initial), 4/5 scr, last pts/stc/sof 1103744404/1104184841/610
> Mar 20 00:05:08 kernel: uvcvideo: frame 128 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1104747737/1104852352/654
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:08 kernel: uvcvideo: frame 129 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/0 scr, last pts/stc/sof 970317305/0/0
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:08 kernel: uvcvideo: frame 130 stats: 0/5/5 packets, 2/4/3 pts (!early initial), 1/2 scr, last pts/stc/sof 3305558780/1887624192/9002
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: frame 131 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1104747737/1105187973/677
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: frame 132 stats: 0/2/2 packets, 1/1/2 pts (!early initial), 1/2 scr, last pts/stc/sof 2197887185/2242411934/43625
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: frame 133 stats: 0/2/2 packets, 0/0/1 pts (!early !initial), 1/2 scr, last pts/stc/sof 2115364547/3239080216/6821
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:08 kernel: uvcvideo: frame 134 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/0 scr, last pts/stc/sof 2957615794/0/0
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:08 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: frame 135 stats: 0/3/3 packets, 1/2/2 pts (!early initial), 0/1 scr, last pts/stc/sof 1105751070/1106191101/744
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:08 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:08 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:08 kernel: uvcvideo: frame 136 stats: 0/7/7 packets, 3/6/4 pts (!early initial), 4/5 scr, last pts/stc/sof 1106754404/1107194231/811
> Mar 20 00:05:08 kernel: uvcvideo: frame 137 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1107757737/1107863615/855
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:08 kernel: uvcvideo: frame 138 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/3950309835/21049
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: frame 139 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/3950309835/21049
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:08 kernel: uvcvideo: frame 140 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/0 scr, last pts/stc/sof 1828285578/0/0
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:08 kernel: uvcvideo: frame 141 stats: 0/2/2 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1828285578/617984761/27859
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: frame 142 stats: 0/0/0 packets, 0/0/0 pts (!early !initial), 0/0 scr, last pts/stc/sof 0/0/0
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:08 kernel: uvcvideo: frame 143 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 3668470870/3375252858/11228
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: frame 144 stats: 0/2/2 packets, 1/1/2 pts (!early initial), 1/2 scr, last pts/stc/sof 1107757737/1108199232/878
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: frame 145 stats: 0/3/3 packets, 1/2/2 pts (!early initial), 2/3 scr, last pts/stc/sof 2876225626/853445806/63314
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:08 kernel: uvcvideo: frame 146 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/0 scr, last pts/stc/sof 1305192272/0/0
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: frame 147 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/0 scr, last pts/stc/sof 1305192272/0/0
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:08 kernel: uvcvideo: frame 148 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/3564772231/19772
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: frame 149 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/3564772231/19772
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: frame 150 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/0 scr, last pts/stc/sof 2985580092/0/0
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:08 kernel: uvcvideo: frame 151 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1108761071/1109200487/944
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: frame 152 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1108761071/1109200487/944
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: frame 153 stats: 0/2/2 packets, 1/1/2 pts (!early initial), 1/2 scr, last pts/stc/sof 309449746/917656453/55409
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: frame 154 stats: 0/4/4 packets, 1/2/2 pts (!early !initial), 2/3 scr, last pts/stc/sof 1965761505/2402964041/49242
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:08 kernel: uvcvideo: frame 155 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1109764404/1110203616/1011
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:08 kernel: uvcvideo: frame 156 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1109764404/1110203616/1011
> Mar 20 00:05:08 kernel: uvcvideo: frame 157 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1110767737/1110874877/1056
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:08 kernel: uvcvideo: frame 158 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/0 scr, last pts/stc/sof 0/0/0
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: frame 159 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/0 scr, last pts/stc/sof 0/0/0
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: frame 160 stats: 0/2/2 packets, 0/0/0 pts (!early !initial), 1/2 scr, last pts/stc/sof 0/3661737668/13062
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:08 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:08 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:08 kernel: uvcvideo: frame 161 stats: 0/2/2 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/1544214573/6054
> Mar 20 00:05:08 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: frame 162 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1110767737/1111208620/1078
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: frame 163 stats: 0/2/2 packets, 1/1/2 pts (!early initial), 0/1 scr, last pts/stc/sof 3297109490/1111879882/1123
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:09 kernel: uvcvideo: frame 164 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/0 scr, last pts/stc/sof 0/0/0
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:09 kernel: uvcvideo: frame 165 stats: 0/2/2 packets, 0/0/0 pts (!early !initial), 0/0 scr, last pts/stc/sof 0/0/0
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: frame 166 stats: 0/3/3 packets, 1/2/2 pts (!early !initial), 1/2 scr, last pts/stc/sof 1111771070/1112211750/1145
> Mar 20 00:05:09 kernel: uvcvideo: frame 167 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1112774404/1112883009/1190
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:09 kernel: uvcvideo: frame 168 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 3665396306/2446668458/21104
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: frame 169 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 3665396306/2446668458/21104
> Mar 20 00:05:09 kernel: uvcvideo: frame 170 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/2665078972/56117
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:09 kernel: uvcvideo: frame 171 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/0 scr, last pts/stc/sof 0/0/0
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:09 kernel: uvcvideo: frame 172 stats: 0/2/2 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/1750820204/46012
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: frame 173 stats: 0/2/2 packets, 0/0/1 pts (!early !initial), 0/1 scr, last pts/stc/sof 1112774404/1113214877/1212
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: frame 174 stats: 0/4/4 packets, 1/2/2 pts (!early initial), 1/2 scr, last pts/stc/sof 3936996058/670340121/44274
> Mar 20 00:05:09 kernel: uvcvideo: frame 175 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/0 scr, last pts/stc/sof 0/0/0
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:09 kernel: uvcvideo: frame 176 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1113777737/1114218007/1279
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: frame 177 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1113777737/1114218007/1279
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: frame 178 stats: 0/3/3 packets, 1/1/2 pts (!early initial), 1/2 scr, last pts/stc/sof 1251669477/2329230767/7502
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:09 kernel: uvcvideo: frame 179 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/816737346/62159
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: frame 180 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/816737346/62159
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: frame 181 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/0 scr, last pts/stc/sof 0/0/0
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: frame 182 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/1750388103/44745
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: frame 183 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1114781071/1115221135/1346
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: frame 184 stats: 0/2/2 packets, 1/1/2 pts (!early initial), 1/2 scr, last pts/stc/sof 1266211186/650362384/14508
> Mar 20 00:05:09 kernel: uvcvideo: frame 185 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/0 scr, last pts/stc/sof 3809791923/0/0
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:09 kernel: uvcvideo: frame 186 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 887378220/2046669931/23726
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: frame 187 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 887378220/2046669931/23726
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: frame 188 stats: 0/2/2 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/3492263727/17239
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:09 kernel: uvcvideo: frame 189 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1115784404/1116224265/1413
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: frame 190 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1115784404/1116224265/1413
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:09 kernel: uvcvideo: frame 191 stats: 0/3/3 packets, 1/2/2 pts (!early initial), 1/2 scr, last pts/stc/sof 737335039/4036685169/18081
> Mar 20 00:05:09 kernel: uvcvideo: frame 192 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1364885077/3541719946/64590
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:09 kernel: uvcvideo: frame 193 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/0 scr, last pts/stc/sof 4224784931/0/0
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: frame 194 stats: 0/3/3 packets, 1/2/2 pts (!early initial), 1/2 scr, last pts/stc/sof 1116787737/1117227389/1479
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: frame 195 stats: 0/2/2 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1117791070/1117896777/1524
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:09 kernel: uvcvideo: frame 196 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 4115239475/325228837/48269
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: frame 197 stats: 0/2/2 packets, 1/1/2 pts (!early initial), 0/1 scr, last pts/stc/sof 2973787157/325228837/48269
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: frame 198 stats: 0/3/3 packets, 0/0/1 pts (!early !initial), 1/2 scr, last pts/stc/sof 1117791070/1118230521/1546
> Mar 20 00:05:09 kernel: uvcvideo: frame 199 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1118794404/1118901781/1591
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:09 kernel: uvcvideo: frame 200 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/1428288380/47983
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: frame 201 stats: 0/2/2 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/1428288380/47983
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: frame 202 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/0 scr, last pts/stc/sof 3201179575/0/0
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: frame 203 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/0 scr, last pts/stc/sof 2942030441/0/0
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: frame 204 stats: 0/2/2 packets, 0/0/1 pts (!early !initial), 1/2 scr, last pts/stc/sof 1118794404/1119233649/1613
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:09 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:09 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:09 kernel: uvcvideo: frame 205 stats: 0/6/6 packets, 2/5/3 pts (!early initial), 4/5 scr, last pts/stc/sof 1119797737/1120236779/1680
> Mar 20 00:05:09 kernel: uvcvideo: frame 206 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1120801071/1120906160/1725
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:09 kernel: uvcvideo: frame 207 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/2112540925/255
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: frame 208 stats: 0/2/2 packets, 0/0/1 pts (!early !initial), 0/1 scr, last pts/stc/sof 2972569201/2112540925/255
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:09 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:09 kernel: uvcvideo: frame 209 stats: 0/4/4 packets, 1/3/2 pts (!early initial), 1/2 scr, last pts/stc/sof 1120801071/1121241779/1747
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:09 kernel: uvcvideo: frame 210 stats: 0/4/4 packets, 2/3/3 pts (!early initial), 2/3 scr, last pts/stc/sof 1248566804/2240644317/55148
> Mar 20 00:05:09 kernel: uvcvideo: frame 211 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 3394535116/3362929871/37867
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:09 kernel: uvcvideo: frame 212 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 3210823653/1303275830/40292
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: frame 213 stats: 0/2/2 packets, 1/1/2 pts (!early initial), 1/2 scr, last pts/stc/sof 1121804404/1122244908/1814
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: frame 214 stats: 0/2/2 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1122807737/1122912417/1858
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:09 kernel: uvcvideo: frame 215 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/137849125/15955
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:09 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:09 kernel: uvcvideo: frame 216 stats: 0/4/4 packets, 0/0/0 pts (!early !initial), 1/2 scr, last pts/stc/sof 0/2883335747/50481
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: frame 217 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1122807737/1123248034/1881
> Mar 20 00:05:09 kernel: uvcvideo: frame 218 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1123811070/1123915547/1925
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:09 kernel: uvcvideo: frame 219 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/0 scr, last pts/stc/sof 0/0/0
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: frame 220 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/0 scr, last pts/stc/sof 0/0/0
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:09 kernel: uvcvideo: frame 221 stats: 0/3/3 packets, 1/1/2 pts (!early initial), 1/2 scr, last pts/stc/sof 3061339524/1940076319/46038
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: frame 222 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/0 scr, last pts/stc/sof 0/0/0
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: frame 223 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1123811070/1124251166/1948
> Mar 20 00:05:09 kernel: uvcvideo: frame 224 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1124814404/1124920551/1992
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:09 kernel: uvcvideo: frame 225 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/0 scr, last pts/stc/sof 3342358046/0/0
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: frame 226 stats: 0/3/3 packets, 0/0/1 pts (!early initial), 0/0 scr, last pts/stc/sof 3342358046/0/0
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:09 kernel: uvcvideo: frame 227 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 2039919655/1326449687/63751
> Mar 20 00:05:09 kernel: uvcvideo: frame 228 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 2039919655/1326449687/63751
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:09 kernel: uvcvideo: frame 229 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1327085941/4119636894/13333
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: frame 230 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1327085941/4119636894/13333
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:09 kernel: uvcvideo: frame 231 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1124814404/1125254296/2015
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: frame 232 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1124814404/1125254296/2015
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:09 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:09 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:09 kernel: uvcvideo: frame 233 stats: 0/3/3 packets, 0/0/1 pts (!early initial), 2/3 scr, last pts/stc/sof 1125817737/1070747337/55039
> Mar 20 00:05:09 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:09 kernel: uvcvideo: frame 234 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/0 scr, last pts/stc/sof 917239201/0/0
> Mar 20 00:05:09 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:10 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:10 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:10 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:10 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:10 kernel: uvcvideo: Dropping payload (out of sync).
> Mar 20 00:05:10 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:10 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:10 kernel: uvcvideo: frame 235 stats: 0/3/3 packets, 2/2/3 pts (!early initial), 1/2 scr, last pts/stc/sof 1125817737/1126257425/33
> Mar 20 00:05:10 kernel: uvcvideo: frame 236 stats: 0/2/2 packets, 0/0/1 pts (!early initial), 1/2 scr, last pts/stc/sof 1126821071/1554518250/60470
> Mar 20 00:05:10 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:10 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:10 kernel: uvcvideo: frame 237 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/0 scr, last pts/stc/sof 1486708980/0/0
> Mar 20 00:05:10 kernel: uvcvideo: Marking buffer as bad (error bit set).
> Mar 20 00:05:10 kernel: uvcvideo: frame 238 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/0 scr, last pts/stc/sof 1486708980/0/0
> Mar 20 00:05:10 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:10 kernel: uvcvideo: frame 239 stats: 0/1/1 packets, 0/0/0 pts (!early !initial), 0/1 scr, last pts/stc/sof 0/1983158229/5178
> Mar 20 00:05:10 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:10 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:10 kernel: uvcvideo: frame 240 stats: 0/2/2 packets, 0/0/0 pts (!early !initial), 1/2 scr, last pts/stc/sof 0/3485570563/24163
> Mar 20 00:05:10 kernel: uvcvideo: frame 241 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/0 scr, last pts/stc/sof 2429055958/0/0
> Mar 20 00:05:10 kernel: uvcvideo: Frame complete (FID bit toggled).
> Mar 20 00:05:10 kernel: uvcvideo: frame 242 stats: 0/1/1 packets, 0/0/1 pts (!early initial), 0/1 scr, last pts/stc/sof 1126821071/1127260553/100
> Mar 20 00:05:10 kernel: uvcvideo: Frame complete (EOF found).
> Mar 20 00:05:10 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:10 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:10 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:10 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:10 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:10 kernel: uvcvideo: uvc_v4l2_release
> Mar 20 00:05:10 kernel: uvcvideo: uvc_v4l2_open
> Mar 20 00:05:10 kernel: uvcvideo: uvc_v4l2_poll
[...cut repeated lines...]
> Mar 20 00:05:13 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:13 kernel: uvcvideo: uvc_v4l2_poll
> Mar 20 00:05:13 kernel: uvcvideo: uvc_v4l2_release
> Mar 20 00:05:16 kernel: uvcvideo: Suspending interface 1
> Mar 20 00:05:16 kernel: uvcvideo: Suspending interface 0


> Bus 002 Device 003: ID 04f2:b42a Chicony Electronics Co., Ltd Front Camera
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.01
>   bDeviceClass          239 Miscellaneous Device
>   bDeviceSubClass         2 
>   bDeviceProtocol         1 Interface Association
>   bMaxPacketSize0        64
>   idVendor           0x04f2 Chicony Electronics Co., Ltd
>   idProduct          0xb42a 
>   bcdDevice           58.25
>   iManufacturer           3 Chicony Electronics Co.,Ltd.
>   iProduct                1 Front Camera
>   iSerial                 2 0x0001
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x043e
>     bNumInterfaces          2
>     bConfigurationValue     1
>     iConfiguration          4 USB Camera
>     bmAttributes         0x80
>       (Bus Powered)
>     MaxPower              500mA
>     Interface Association:
>       bLength                 8
>       bDescriptorType        11
>       bFirstInterface         0
>       bInterfaceCount         2
>       bFunctionClass         14 Video
>       bFunctionSubClass       3 Video Interface Collection
>       bFunctionProtocol       0 
>       iFunction               5 Front Camera
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      1 Video Control
>       bInterfaceProtocol      0 
>       iInterface              5 Front Camera
>       VideoControl Interface Descriptor:
>         bLength                13
>         bDescriptorType        36
>         bDescriptorSubtype      1 (HEADER)
>         bcdUVC               1.00
>         wTotalLength       0x004e
>         dwClockFrequency       15.000000MHz
>         bInCollection           1
>         baInterfaceNr( 0)       1
>       VideoControl Interface Descriptor:
>         bLength                18
>         bDescriptorType        36
>         bDescriptorSubtype      2 (INPUT_TERMINAL)
>         bTerminalID             1
>         wTerminalType      0x0201 Camera Sensor
>         bAssocTerminal          0
>         iTerminal               0 
>         wObjectiveFocalLengthMin      0
>         wObjectiveFocalLengthMax      0
>         wOcularFocalLength            0
>         bControlSize                  3
>         bmControls           0x00000004
>           Auto-Exposure Priority
>       VideoControl Interface Descriptor:
>         bLength                11
>         bDescriptorType        36
>         bDescriptorSubtype      5 (PROCESSING_UNIT)
>       Warning: Descriptor too short
>         bUnitID                 2
>         bSourceID               1
>         wMaxMultiplier          0
>         bControlSize            2
>         bmControls     0x0000177f
>           Brightness
>           Contrast
>           Hue
>           Saturation
>           Sharpness
>           Gamma
>           White Balance Temperature
>           Backlight Compensation
>           Gain
>           Power Line Frequency
>           White Balance Temperature, Auto
>         iProcessing             0 
>         bmVideoStandards     0x09
>           None
>           SECAM - 625/50
>       VideoControl Interface Descriptor:
>         bLength                 9
>         bDescriptorType        36
>         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
>         bTerminalID             3
>         wTerminalType      0x0101 USB Streaming
>         bAssocTerminal          0
>         bSourceID               4
>         iTerminal               0 
>       VideoControl Interface Descriptor:
>         bLength                27
>         bDescriptorType        36
>         bDescriptorSubtype      6 (EXTENSION_UNIT)
>         bUnitID                 4
>         guidExtensionCode         {1229a78c-47b4-4094-b0ce-db07386fb938}
>         bNumControl             2
>         bNrPins                 1
>         baSourceID( 0)          2
>         bControlSize            2
>         bmControls( 0)       0x00
>         bmControls( 1)       0x06
>         iExtension              0 
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x83  EP 3 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0010  1x 16 bytes
>         bInterval               6
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       0
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0 
>       iInterface              0 
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               1
>         INTERFACE CLASS:  10 24 01 03 ba 03 81 00 03 02 01 00 01 00 00 00
>         INTERFACE CLASS:  1b 24 04 01 08 59 55 59 32 00 00 10 00 80 00 00 aa 00 38 9b 71 10 01 00 00 00 00
>         INTERFACE CLASS:  22 24 05 01 00 80 02 e0 01 00 00 65 04 00 00 ca 08 00 60 09 00 15 16 05 00 02 15 16 05 00 2a 2c 0a 00
>         INTERFACE CLASS:  22 24 05 02 00 40 01 f0 00 00 40 19 01 00 80 32 02 00 58 02 00 15 16 05 00 02 15 16 05 00 2a 2c 0a 00
>         INTERFACE CLASS:  22 24 05 03 00 80 02 68 01 00 c0 4b 03 00 80 97 06 00 08 07 00 15 16 05 00 02 15 16 05 00 2a 2c 0a 00
>         INTERFACE CLASS:  1e 24 05 04 00 00 05 d0 02 00 00 ca 08 00 00 ca 08 00 20 1c 00 40 42 0f 00 01 40 42 0f 00
>         INTERFACE CLASS:  1e 24 05 05 00 c0 03 1c 02 00 a0 f1 04 00 a0 f1 04 00 d2 0f 00 40 42 0f 00 01 40 42 0f 00
>         INTERFACE CLASS:  1e 24 05 06 00 50 03 e0 01 00 c0 e1 03 00 c0 e1 03 00 6c 0c 00 40 42 0f 00 01 40 42 0f 00
>         INTERFACE CLASS:  22 24 05 07 00 a8 01 f0 00 00 a8 74 01 00 50 e9 02 00 1b 03 00 15 16 05 00 02 15 16 05 00 2a 2c 0a 00
>         INTERFACE CLASS:  22 24 05 08 00 80 02 e0 01 00 00 65 04 00 00 ca 08 00 60 09 00 15 16 05 00 02 15 16 05 00 2a 2c 0a 00
>         INTERFACE CLASS:  0a 24 03 00 01 80 02 e0 01 00
>         INTERFACE CLASS:  06 24 0d 01 01 04
>         INTERFACE CLASS:  0b 24 06 02 08 01 01 00 00 00 00
>         INTERFACE CLASS:  22 24 07 01 00 80 02 e0 01 00 00 65 04 00 00 ca 08 00 60 09 00 15 16 05 00 02 15 16 05 00 2a 2c 0a 00
>         INTERFACE CLASS:  22 24 07 02 00 40 01 f0 00 00 40 19 01 00 80 32 02 00 58 02 00 15 16 05 00 02 15 16 05 00 2a 2c 0a 00
>         INTERFACE CLASS:  22 24 07 03 00 80 02 68 01 00 c0 4b 03 00 80 97 06 00 08 07 00 15 16 05 00 02 15 16 05 00 2a 2c 0a 00
>         INTERFACE CLASS:  22 24 07 04 00 00 05 d0 02 00 00 2f 0d 00 00 5e 1a 00 20 1c 00 15 16 05 00 02 15 16 05 00 2a 2c 0a 00
>         INTERFACE CLASS:  22 24 07 05 00 c0 03 1c 02 00 70 6a 07 00 e0 d4 0e 00 d2 0f 00 15 16 05 00 02 15 16 05 00 2a 2c 0a 00
>         INTERFACE CLASS:  22 24 07 06 00 50 03 e0 01 00 a0 d2 05 00 40 a5 0b 00 6c 0c 00 15 16 05 00 02 15 16 05 00 2a 2c 0a 00
>         INTERFACE CLASS:  22 24 07 07 00 a8 01 f0 00 00 a8 74 01 00 50 e9 02 00 1b 03 00 15 16 05 00 02 15 16 05 00 2a 2c 0a 00
>         INTERFACE CLASS:  22 24 07 08 00 80 02 e0 01 00 00 65 04 00 00 ca 08 00 60 09 00 15 16 05 00 02 15 16 05 00 2a 2c 0a 00
>         INTERFACE CLASS:  0a 24 03 00 01 80 02 e0 01 00
>         INTERFACE CLASS:  06 24 0d 01 01 04
>         INTERFACE CLASS:  38 24 0e 03 08 4d 34 32 30 00 00 10 00 80 00 00 aa 00 38 9b 71 32 56 55 59 00 00 10 00 80 00 00 aa 00 38 9b 71 33 56 55 59 00 00 10 00 80 00 00 aa 00 38 9b 71 00 01 00
>         INTERFACE CLASS:  22 24 0f 01 00 80 02 e0 01 00 00 65 04 00 00 ca 08 00 60 09 00 15 16 05 00 02 15 16 05 00 2a 2c 0a 00
>         INTERFACE CLASS:  22 24 0f 02 00 40 01 f0 00 00 40 19 01 00 80 32 02 00 58 02 00 15 16 05 00 02 15 16 05 00 2a 2c 0a 00
>         INTERFACE CLASS:  22 24 0f 03 00 80 02 68 01 00 c0 4b 03 00 80 97 06 00 08 07 00 15 16 05 00 02 15 16 05 00 2a 2c 0a 00
>         INTERFACE CLASS:  22 24 0f 04 00 00 05 d0 02 00 00 65 04 00 00 ca 08 00 20 1c 00 40 42 0f 00 02 40 42 0f 00 80 84 1e 00
>         INTERFACE CLASS:  1e 24 0f 05 00 c0 03 1c 02 00 a0 f1 04 00 a0 f1 04 00 d2 0f 00 40 42 0f 00 01 40 42 0f 00
>         INTERFACE CLASS:  1e 24 0f 06 00 50 03 e0 01 00 c0 e1 03 00 c0 e1 03 00 6c 0c 00 40 42 0f 00 01 40 42 0f 00
>         INTERFACE CLASS:  22 24 0f 07 00 a8 01 f0 00 00 a8 74 01 00 50 e9 02 00 1b 03 00 15 16 05 00 02 15 16 05 00 2a 2c 0a 00
>         INTERFACE CLASS:  22 24 0f 08 00 80 02 e0 01 00 00 65 04 00 00 ca 08 00 60 09 00 15 16 05 00 02 15 16 05 00 2a 2c 0a 00
>         INTERFACE CLASS:  0a 24 03 00 01 80 02 e0 01 00
>         INTERFACE CLASS:  06 24 0d 01 01 04
> Binary Object Store Descriptor:
>   bLength                 5
>   bDescriptorType        15
>   wTotalLength       0x000c
>   bNumDeviceCaps          1
>   USB 2.0 Extension Device Capability:
>     bLength                 7
>     bDescriptorType        16
>     bDevCapabilityType      2
>     bmAttributes   0x00000002
>       HIRD Link Power Management (LPM) Supported
> Device Status:     0x0000
>   (Bus Powered)

Regards,
Dominik
-- 
Fedora   https://getfedora.org  |  RPM Fusion  http://rpmfusion.org
There should be a science of discontent. People need hard times and
oppression to develop psychic muscles.
        -- from "Collected Sayings of Muad'Dib" by the Princess Irulan
