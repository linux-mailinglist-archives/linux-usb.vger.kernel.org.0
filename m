Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B72F2557D3
	for <lists+linux-usb@lfdr.de>; Fri, 28 Aug 2020 11:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728717AbgH1JjB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Aug 2020 05:39:01 -0400
Received: from mga04.intel.com ([192.55.52.120]:65292 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728016AbgH1JjA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 28 Aug 2020 05:39:00 -0400
IronPort-SDR: qtmir07ZuYXfhR2xrHhT+oRpKnc7KftWeY1R92TV3I25LyWN25J0cCoHvMY203VdA2KidGo+tj
 NNqM+vgRrhvg==
X-IronPort-AV: E=McAfee;i="6000,8403,9726"; a="154053288"
X-IronPort-AV: E=Sophos;i="5.76,363,1592895600"; 
   d="scan'208";a="154053288"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2020 02:38:59 -0700
IronPort-SDR: Ut9KRfr4SGf5laRD8mXE62p6pqgQNERWE+yGTMCfW8KYu4yXQeHj+qtfoFsXkYjybPwXWFLHXe
 7KTlR1hVvZmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,363,1592895600"; 
   d="scan'208";a="403704515"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 28 Aug 2020 02:38:56 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 28 Aug 2020 12:38:35 +0300
Date:   Fri, 28 Aug 2020 12:38:35 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     ChiYuan Huang <u0084500@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, robh+dt@kernel.org,
        matthias.bgg@gmail.com, Guenter Roeck <linux@roeck-us.net>,
        cy_huang <cy_huang@richtek.com>, gene_chen@richtek.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] usb typec: mt6360: Add support for mt6360 Type-C
 driver
Message-ID: <20200828093835.GC174928@kuha.fi.intel.com>
References: <1598527137-6915-1-git-send-email-u0084500@gmail.com>
 <20200827140001.GE813478@kuha.fi.intel.com>
 <CADiBU393V_iQw_8Hx2braL=8QpvQuTY0059C-XkqmjO9W=aBgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADiBU393V_iQw_8Hx2braL=8QpvQuTY0059C-XkqmjO9W=aBgQ@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 27, 2020 at 10:51:43PM +0800, ChiYuan Huang wrote:
> Heikki Krogerus <heikki.krogerus@linux.intel.com> 於 2020年8月27日 週四 下午10:00寫道：
> >
> > On Thu, Aug 27, 2020 at 07:18:55PM +0800, cy_huang wrote:
> > > From: ChiYuan Huang <cy_huang@richtek.com>
> > >
> > > Mediatek MT6360 is a multi-functional IC that includes USB Type-C.
> > > It works with Type-C Port Controller Manager to provide USB PD
> > > and USB Type-C functionalities.
> > >
> > > v1 to v2
> > > 1. Add fix to Prevent the race condition from interrupt and tcpci port
> > > unregister during module remove.
> > >
> > > v2 to v3
> > > 1. Change comment style for the head of source code.
> > > 2. No need to print error for platform_get_irq_byname.
> > > 3. Fix tcpci_register_port check from IS_ERR_OR_NULL to IS_ERR.
> > > 4. Rename driver/Kconfig/Makefile form mt6360 to mt636x.
> > > 5. Rename DT binding documents from mt6360 to mt636x.
> >
> > You don't place additional changelog here...
> >
> > > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > > ---
> >
> > You put it here, after that '---' marker:
> > https://www.kernel.org/doc/html/latest/process/submitting-patches.html#the-canonical-patch-format
> >
> HI Hekki:
>      after reading the document, I have a little bit confused how to
> use diffstat for the changelog.
>       Is there any example that make me know to write a clear
> description for the changelog?

Picking the latest patch from linux-usb ml. with version history:
https://lore.kernel.org/linux-usb/1598083553-31896-11-git-send-email-chunfeng.yun@mediatek.com/

See how the last tag line "Signed-off-by: Chunfeng Yun..." is followed
by marker "---", which then is followed by the version history (the
version history is then also ended with the marker "---", a step that
I don't think is mandatory, but commonly used and often recommended).

That way that patch version history does not contaminate the actual
commit message.


thanks,

-- 
heikki
