Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC1CD135EE9
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2020 18:10:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731560AbgAIRKH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jan 2020 12:10:07 -0500
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:34802 "EHLO
        wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731544AbgAIRKH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jan 2020 12:10:07 -0500
X-Greylist: delayed 2455 seconds by postgrey-1.27 at vger.kernel.org; Thu, 09 Jan 2020 12:10:06 EST
Received: from [2003:a:659:3f00:1e6f:65ff:fe31:d1d5] (helo=hermes.fivetechno.de); authenticated
        by wp126.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        id 1ipagH-0005oH-AL; Thu, 09 Jan 2020 17:29:09 +0100
X-Virus-Scanned: by amavisd-new 2.11.1 using newest ClamAV at
        linuxbbg.five-lan.de
Received: from [192.168.34.101] (p5098d998.dip0.t-ipconnect.de [80.152.217.152])
        (authenticated bits=0)
        by hermes.fivetechno.de (8.15.2/8.14.5/SuSE Linux 0.8) with ESMTPSA id 009GT7fs001705
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
        Thu, 9 Jan 2020 17:29:07 +0100
From:   Markus Reichl <m.reichl@fivetechno.de>
Organization: five technologies GmbH
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        linux-rockchip@lists.infradead.org,
        Markus Reichl <m.reichl@fivetechno.de>
Subject: [Bug ?] usb :typec :tcpm :fusb302
Message-ID: <0ac6bbe7-6395-526d-213c-ac58a19d8673@fivetechno.de>
Date:   Thu, 9 Jan 2020 17:29:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;m.reichl@fivetechno.de;1578589806;e5dbc83c;
X-HE-SMSGID: 1ipagH-0005oH-AL
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I'm working with a ROC-RK3399-PC arm64 board from firefly, circuit sheet [1].
The board is powered from an USB-C type connector via an FUSB302 PD controller.
With measured 15W+ power consumption it should use higher voltage PD modes than
the standard 5V USB-C mode.

When I add the related connector node in DTS [2] the FUSB302 initializes
the right PD mode (e.g. 15V/3A).

But during initialisation the PD is switched off shortly and the board has a blackout.
When I inject a backup supply voltage behind the FUSB302 (e.g. at SYS_12V line) during boot
I can remove the backup after succesfull setting up the PD and the board will run fine.

Is it possible to change the behaviour of the fusb302 driver to not power down the PD supply
during init?

In vendor kernel (4.4) this is done somehow but the sources are too different for me to find
out how.

Gruß,
-- 
Markus Reichl

[1]
http://download.t-firefly.com/product/RK3399/Docs/Hardware/%E5%8E%9F%E7%90%86%E5%9B%BE%E5%92%8C%E8%B4%B4%E7%89%87%E5%9B%BE/ROC-RK3399-PC/ROC-3399-PC-V10-A-20180804_%E5%8E%9F%E7%90%86%E5%9B%BE.pdf

[2]
https://lkml.org/lkml/2019/12/10/517
