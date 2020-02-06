Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED3215452C
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2020 14:43:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727807AbgBFNnw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Feb 2020 08:43:52 -0500
Received: from cable.insite.cz ([84.242.75.189]:51811 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727361AbgBFNnw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 Feb 2020 08:43:52 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 506FEA1A40B02
        for <linux-usb@vger.kernel.org>; Thu,  6 Feb 2020 14:43:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1580996629; bh=m7xNi/x9/zq4+dizicTLja/12pKEevFPGS2aB8Jn6tg=;
        h=To:From:Subject:Date:From;
        b=Tng0NkjBb7u/c7k+0YJ8t9/LigcfTWnuDKEvCjEsWQ95bY0g9wYTjjCSwlKmgjv7T
         32uufppcuJ7rMpEJ+UaMf/qvMDifVCpbW16qS4S09AJW6t8e8/EdlcpAvfuHo+D15M
         COkf/S1bi/0oOwN3F2hr5oqTbbBkBoFx0smhxqF8=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id lDv_wSddkvCW for <linux-usb@vger.kernel.org>;
        Thu,  6 Feb 2020 14:43:49 +0100 (CET)
Received: from [192.168.100.32] (unknown [192.168.100.32])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 25D3DA1A40B01
        for <linux-usb@vger.kernel.org>; Thu,  6 Feb 2020 14:43:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1580996629; bh=m7xNi/x9/zq4+dizicTLja/12pKEevFPGS2aB8Jn6tg=;
        h=To:From:Subject:Date:From;
        b=Tng0NkjBb7u/c7k+0YJ8t9/LigcfTWnuDKEvCjEsWQ95bY0g9wYTjjCSwlKmgjv7T
         32uufppcuJ7rMpEJ+UaMf/qvMDifVCpbW16qS4S09AJW6t8e8/EdlcpAvfuHo+D15M
         COkf/S1bi/0oOwN3F2hr5oqTbbBkBoFx0smhxqF8=
To:     Linux USB <linux-usb@vger.kernel.org>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Subject: usb:gadget.f_uac2: Options for u_audio.c behavior when UAC2 host is
 disconnected/idle
Message-ID: <df2eeff0-ca9c-35f9-2e72-8426b2cf72c9@ivitera.com>
Date:   Thu, 6 Feb 2020 14:43:48 +0100
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

I would like to start a discussion about options to make the g_audio 
device more usable. Currently if the USB UAC2 function does not 
supply/consume any audio data (USB disconnected or the host side is not 
using the UAC2 gadget, the g_audio devices (both capture and playback) 
are waiting, leading eventually to an error. This makes using the 
feature rather inconvenient.

Possible options (certainly more are available)

1) The alsa devices will be openable at any time and when the UAC2 is 
not producing/consuming, the alsa devices will be generating 
zeros/dropping samples. Dropping samples would be similar to the 
snd-aloop behavior.

2) Opening the alsa devices will fail when the UAC2 is not actively 
running, and the pcm stream will be closed when UAC2 stops being active. 
This is similar to how SPDIF receivers are coded in alsa drivers - if 
change in the incoming SPDIF stream is detected (no samples, different 
sample rate), the pcm stream is closed 
https://github.com/torvalds/linux/blob/master/sound/i2c/other/ak4117.c#L504 
It is up to the application to handle the error/close.

The behavior could be configurable via some params, if needed.

Thanks a lot for any suggestions and recommendations.

Best regards,


Pavel.

