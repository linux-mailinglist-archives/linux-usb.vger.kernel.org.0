Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D9562C5656
	for <lists+linux-usb@lfdr.de>; Thu, 26 Nov 2020 14:45:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390289AbgKZNoc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Nov 2020 08:44:32 -0500
Received: from cable.insite.cz ([84.242.75.189]:53989 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390653AbgKZNoX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Nov 2020 08:44:23 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 8BC0AA9D31F71;
        Thu, 26 Nov 2020 14:44:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1606398257; bh=gQ+shCm6MCA8w2n5q0BWlcK9cbCQrq8coXa9TWHd4qw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ob5K5keWjEYdZHCqI8r4ZChoLjl+X8HVGKHCshyxuMU6Y+Dobus/9vR1m0NLEdChh
         AnHiOzAyXUiSlKiiVijOgTS4jWj+up5iHH7/bZAqD3zi0fMddiB4NyxOByPgkniyvX
         Lfse9AY1ytwfxk71uyeDOmbCToNkdMZlwaAKhaFQ=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id U97XVNLIVsWH; Thu, 26 Nov 2020 14:44:17 +0100 (CET)
Received: from [192.168.100.21] (unknown [192.168.100.21])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 6236DA9D31F75;
        Thu, 26 Nov 2020 14:44:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1606398257; bh=gQ+shCm6MCA8w2n5q0BWlcK9cbCQrq8coXa9TWHd4qw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ob5K5keWjEYdZHCqI8r4ZChoLjl+X8HVGKHCshyxuMU6Y+Dobus/9vR1m0NLEdChh
         AnHiOzAyXUiSlKiiVijOgTS4jWj+up5iHH7/bZAqD3zi0fMddiB4NyxOByPgkniyvX
         Lfse9AY1ytwfxk71uyeDOmbCToNkdMZlwaAKhaFQ=
Subject: Re: [PATCH 0/3] UAC2 Gadget: feedback endpoint support
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Glenn Schmottlach <gschmottlach@gmail.com>
Cc:     Peter Chen <peter.chen@nxp.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <1604794711-8661-1-git-send-email-ruslan.bilovol@gmail.com>
 <20201111092941.GJ14896@b29397-desktop>
 <CAB=otbSAGhDYxim9_fsyH4pZCLqgq+bxNJfv5hXqgQRVngVaig@mail.gmail.com>
 <CAMS2kBF5Gvhnf7AzdeSFeVeWBLhtHM_hHfTvMLTN-3Jkh=BwHw@mail.gmail.com>
 <CAB=otbTK0j03HjiLS-tqqaBTuavaFEJs49hpKPj2Df8e1_WN+A@mail.gmail.com>
 <1jblfk8di1.fsf@starbuckisacylon.baylibre.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <8bf995b1-7b95-4c79-fbe8-275f29716c0e@ivitera.com>
Date:   Thu, 26 Nov 2020 14:44:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1jblfk8di1.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: cs-CZ
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dne 26. 11. 20 v 14:16 Jerome Brunet napsal(a):
> 
>> Maximum data rates that I used were (AFAIR) 8 channel 192kHz/32bit,
>> but there is another issue with high data rate if someone uses so many
>> channels, very high sampling frequency or sample size that data can't
>> fit into allowed (by USB spec) max packet size of endpoint. In this case
>> need to decrease bInterval of endpoint.

Should anyone test the patches with RPi4 dwc2 as the gadget, please note 
the recently accepted patch 
https://patchwork.kernel.org/project/linux-usb/patch/e9e7d070-593c-122f-3a5c-2435bb147ab2@ivitera.com/ 
which allows using full 1024 bytes maxpacketsize on EP OUT. It is not an 
enumeration issue, but the old (= existing) RX FIFO size drops data with 
packet sizes above 960 bytes.

Thanks a lot for the great work.

Best regards,

Pavel.
