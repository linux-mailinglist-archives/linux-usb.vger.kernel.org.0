Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD38461B71
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jul 2019 09:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727912AbfGHHzv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Jul 2019 03:55:51 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:8648 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbfGHHzv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 Jul 2019 03:55:51 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d22f7010000>; Mon, 08 Jul 2019 00:55:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 08 Jul 2019 00:55:50 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 08 Jul 2019 00:55:50 -0700
Received: from tbergstrom-lnx.Nvidia.com (172.20.13.39) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3; Mon, 8 Jul 2019 07:55:49 +0000
Received: by tbergstrom-lnx.Nvidia.com (Postfix, from userid 1000)
        id A8A4342890; Mon,  8 Jul 2019 10:55:47 +0300 (EEST)
Date:   Mon, 8 Jul 2019 10:55:47 +0300
From:   Peter De Schrijver <pdeschrijver@nvidia.com>
To:     JC Kuo <jckuo@nvidia.com>
CC:     Jon Hunter <jonathanh@nvidia.com>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <afrid@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <nkristam@nvidia.com>,
        <skomatineni@nvidia.com>
Subject: Re: [PATCH 3/8] phy: tegra: xusb: t210: rearrange UPHY init
Message-ID: <20190708075547.GC12715@pdeschrijver-desktop.Nvidia.com>
References: <20190614074652.21960-1-jckuo@nvidia.com>
 <20190614074652.21960-4-jckuo@nvidia.com>
 <1a57e3e6-a9b2-87ba-a76b-1785ddd0d935@nvidia.com>
 <94af84e5-5bc3-d481-b784-c0e0dd2b7859@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <94af84e5-5bc3-d481-b784-c0e0dd2b7859@nvidia.com>
X-NVConfidentiality: public
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1562572546; bh=s7gBsVMVHBYedTs39MDLgXJIF7Cw3ubVGD31xQtf62k=;
        h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
         MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
         X-NVConfidentiality:User-Agent:X-Originating-IP:X-ClientProxiedBy;
        b=p6WUTZQY4cm2PThQd0HgVbUZbnnY1U85OUByI1mZ9YCqzCq7bT16pIGNKKKkmOeKG
         NDlhAB75e62a7dCRWHs2wXPvwaFzmCpW6cF4HokXIHtOIsttsbxo3UZpHOdK1Ij+UA
         JuYNd22yjjQea03IESbEabSg6i2MpsC4l8KrBz0c74DRKO58ano11g3LDByDe7Aywu
         qBtJElKuIZWMD7WI9ptY10GEj4PKUozaPkjX2UbJhf6ofTZDNCTPkliLcrmpek2YST
         nfBV47i0Lcl3oBVl4jU2AY2rdA4vE0a7H5hvAm0cvzVxgz/V2nF+3tMlFWQumnj8gy
         GpAULTRybhNmg==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 05, 2019 at 02:48:49PM +0800, JC Kuo wrote:
> > Looks like you are moving all the code from the port enable to the phy
> > enable and after this change the port enable does nothing. Do we not
> > differentiate between phy and port? I think a bit more description is
> > necessary here to describe the impact of this change.
> Sorry that I am not sure whether I should use "LP0" or "SC7" for Linux system
> suspend (either to ram or disk). Should I use SC7 instead of LP0?

Please use SC7 rather than LP0.

Peter.

