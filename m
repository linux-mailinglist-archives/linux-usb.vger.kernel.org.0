Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA31422E979
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jul 2020 11:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbgG0JvU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jul 2020 05:51:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:36204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726196AbgG0JvU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 27 Jul 2020 05:51:20 -0400
Received: from localhost (unknown [122.171.202.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 28CD820759;
        Mon, 27 Jul 2020 09:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595843480;
        bh=/Nkd3YBv64YbNEYFecnspgikZgRL+85WrksxxlVoT0I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VGVwa5C3r0p7g3xdE0OicJ5ZPXih40I1dEWTzt7TI0B1iKKgIJgAp8uLai4TrXCbn
         1vz3BtkhI3uniG7qPbvD9VEdq91WHgb1YAHhlgAYxS8sF0+2oJSe6NWBNr10+yIZe0
         Awo16hVElKS/ty7yqR7WrqJnTmtSSQfpuEKHoRBs=
Date:   Mon, 27 Jul 2020 15:21:15 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        paul@crapouillou.net, prasannatsmkumar@gmail.com, kishon@ti.com,
        gor@linux.ibm.com, hca@linux.ibm.com,
        christophe.jaillet@wanadoo.fr, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: Re: [PATCH v6 3/5] USB: PHY: JZ4770: Add support for new Ingenic
 SoCs.
Message-ID: <20200727095115.GV12965@vkoul-mobl>
References: <20200725035159.31231-1-zhouyanjie@wanyeetech.com>
 <20200725035159.31231-4-zhouyanjie@wanyeetech.com>
 <87r1t0nmpr.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87r1t0nmpr.fsf@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 25-07-20, 09:16, Felipe Balbi wrote:
> 
> Hi,
> 
> 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com> writes:
> > Add support for probing the phy-jz4770 driver on the JZ4780 SoC,
> > the X1000 SoC and the X1830 SoC from Ingenic.
> >
> > Tested-by: 周正 (Zhou Zheng) <sernia.zhou@foxmail.com>
> > Co-developed-by: 漆鹏振 (Qi Pengzhen) <aric.pzqi@ingenic.com>
> > Signed-off-by: 漆鹏振 (Qi Pengzhen) <aric.pzqi@ingenic.com>
> > Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> 
> It would be better to move this driver to drivers/phy before adding
> support for new SoCs. We want to remove drivers/usb/phy/ in the near
> future, any help is welcome.

Yeah I was about to ask why should this patch up drivers/usb/phy/ rather
than move to drivers/phy, thanks for confirming that :)

Looking forward to move

-- 
~Vinod
