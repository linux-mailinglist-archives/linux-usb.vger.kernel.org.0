Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA35B128831
	for <lists+linux-usb@lfdr.de>; Sat, 21 Dec 2019 09:33:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbfLUIdG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 21 Dec 2019 03:33:06 -0500
Received: from cable.insite.cz ([84.242.75.189]:58834 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726729AbfLUIce (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 21 Dec 2019 03:32:34 -0500
X-Greylist: delayed 588 seconds by postgrey-1.27 at vger.kernel.org; Sat, 21 Dec 2019 03:32:33 EST
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 762DCA1A40B06
        for <linux-usb@vger.kernel.org>; Sat, 21 Dec 2019 09:22:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1576916562; bh=oyowXZG47iAR04qQPUwVWGJkUpug/1u/w65TRQ3eoi8=;
        h=To:From:Subject:Date:From;
        b=TH1ortl6cok/eQAcwGKAw/Gph0CehUfQrDs7CkyhErXp8x1rAvLF6ScO07ZqmXngO
         iWtFbX/epn4MKKwvb9geg6xxS49FKaWJ/tcCUMRd3/T5jTDZir+eEA60QIBJfVtt6W
         C6AUarf53xtjCti4SO9XDph18kAAztgGIev2weP0=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Blh5ggHXJShT for <linux-usb@vger.kernel.org>;
        Sat, 21 Dec 2019 09:22:36 +0100 (CET)
Received: from [192.168.105.151] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 733A3A1A40B01
        for <linux-usb@vger.kernel.org>; Sat, 21 Dec 2019 09:22:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1576916556; bh=oyowXZG47iAR04qQPUwVWGJkUpug/1u/w65TRQ3eoi8=;
        h=To:From:Subject:Date:From;
        b=a2F+OYesa1ZG2E16IkEkr1HItqcITG5Y3VNtYzi8J0b/2hZSDrEhUGMYE5E8SPOYO
         HIrAVoEDgmtmh2Y5fQn5J33XU7ssUbLJRP+d82j229aTdEVKtBt30msU9I7zRfVGdU
         pRmNxkGmxLSGNKGtsf9TXqveRWLuceUZPX7jhgAc=
To:     linux-usb@vger.kernel.org
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Subject: USB: UAC2: Custom bInterval values
Message-ID: <d8d929f3-9479-85fe-915e-ef1f1386bf6d@ivitera.com>
Date:   Sat, 21 Dec 2019 09:22:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I would like to add support for custom EP IN and EP OUT bInterval values 
in f_uac2.c, to allow fine-tuning the gadget for higher samplerates.

For now the easiest way to me seems to add the params to uac2_opts and 
add module params to  g_audio module (to the existing params p_chmask, 
p_srate, etc.). Please will such change be accepted to upstream?

Thanks,

Pavel.
