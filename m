Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9138113684A
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2020 08:29:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725879AbgAJH3L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Jan 2020 02:29:11 -0500
Received: from cable.insite.cz ([84.242.75.189]:58994 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725829AbgAJH3L (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 10 Jan 2020 02:29:11 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 808ACA1A40B08;
        Fri, 10 Jan 2020 08:29:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1578641347; bh=iqcaE9RCc8D/fTosyYCXQRgCUUKL11iXHS5akVhev6Y=;
        h=To:From:Subject:Date:From;
        b=NaXwj/CX4U9/kHOLrjlJrLOWKlL16GnyXnaJL6VeURoE2nmGohpFqN6cpnhoRjINu
         iLin+fhC7Pn7Iq57t2MTNHuiBIcIxnB9dTaupw/y3ncqN40+y5bp6TkNsTAqG5qZgo
         LJ4qaHLcdeMayQSAAOL1HqTbpPI/I2kkZIKaExHM=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id W78igCiAB9Iz; Fri, 10 Jan 2020 08:29:07 +0100 (CET)
Received: from [192.168.100.32] (unknown [192.168.100.32])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 4FBA9A1A40B01;
        Fri, 10 Jan 2020 08:29:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1578641347; bh=iqcaE9RCc8D/fTosyYCXQRgCUUKL11iXHS5akVhev6Y=;
        h=To:From:Subject:Date:From;
        b=NaXwj/CX4U9/kHOLrjlJrLOWKlL16GnyXnaJL6VeURoE2nmGohpFqN6cpnhoRjINu
         iLin+fhC7Pn7Iq57t2MTNHuiBIcIxnB9dTaupw/y3ncqN40+y5bp6TkNsTAqG5qZgo
         LJ4qaHLcdeMayQSAAOL1HqTbpPI/I2kkZIKaExHM=
To:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Subject: USB:UAC2: Incorrect req->length > maxpacket*mc
Message-ID: <4f2df2bc-e208-fffb-48e2-3e14cd093103@ivitera.com>
Date:   Fri, 10 Jan 2020 08:29:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Together with dwc2 maintainer Minas Harutyunyan we have been
troubleshooting various issues of dwc2 on RPi4. We hit a problem where
the g_audio in capture (EP OUT, playback from USB host) requests req->
length larger than maxpacket*mc.

As a workaround we removed the check in dwc2/gadget.c, however that is
not a proper solution. Minas with his team decided to add a patch where 
dwc2 will rejecting this type of wrong requests in dwc2_hsotg_ep_queue()
function, to not process these request at all. The f_uac2 + g_audio
gadget should restrain from sending such requests.

Steps to reproduce:

* Changing fs_epout_desc.bInterval in f_uac2.c from 4 (1ms) to 1 (125us) 
- the goal is to maximize available throughput of the audio gadget

* Loading the g_audio module with c_srate=48000, c_ssize=2, c_chmask=2 - 
i.e. standard 48kHz/16bit/2ch USB playback -> alsa capture

This combination produces mps=24 and mc=1 for EP OUT. Yet the audio 
function driver sometimes queues request with req->length 192.


Please may I ask for fixing the audio function  in this respect? 
Unfortunately that is way above my knowledge of that code/requirements. 
However, I can send debug dump for u_audio.c, f_uac2.c, gadget.c if needed.

Thanks a lot in advance.

Best regards,

Pavel.
