Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4C8C426197
	for <lists+linux-usb@lfdr.de>; Fri,  8 Oct 2021 03:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbhJHBLx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Oct 2021 21:11:53 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:50047 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230234AbhJHBLx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Oct 2021 21:11:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1633655399; x=1665191399;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7tkMJdtxazNFO5X/qtQrpQubb/3nsgAJXzZlad0D/ow=;
  b=P2sd/Nawlz4kq/t6rNXw9mf0LAdkNc+ix1LgzWONiJNfn9tI9NkzuJhZ
   Mzf2H5Fal7KPxrVeCt3QqL5HttPlNQO2HY3VwDfd1rdArauCY/EbGRNaM
   lAfjIj8TlLzYXaAlc/TsOX/P8H6lC68eQb6X3eeLVIWtUdNpF4NKyQWkb
   Q=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 07 Oct 2021 18:09:59 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2021 18:09:58 -0700
Received: from jackp-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 7 Oct 2021 18:09:57 -0700
Date:   Thu, 7 Oct 2021 18:09:52 -0700
From:   Jack Pham <quic_jackp@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Linyu Yuan <quic_linyyuan@quicinc.com>,
        Felipe Balbi <balbi@kernel.org>, <linux-usb@vger.kernel.org>,
        Trilok Soni <quic_tsoni@quicinc.com>
Subject: Re: [PATCH v5 3/3] usb: gadget: configfs: add some trace event
Message-ID: <20211008005910.GA7123@jackp-linux.qualcomm.com>
References: <1630976977-13938-1-git-send-email-quic_linyyuan@quicinc.com>
 <1630976977-13938-4-git-send-email-quic_linyyuan@quicinc.com>
 <YVwz/EY4A/y4rY48@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YVwz/EY4A/y4rY48@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 05, 2021 at 01:16:12PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Sep 07, 2021 at 09:09:37AM +0800, Linyu Yuan wrote:

> > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>

> > diff --git a/drivers/usb/gadget/configfs_trace.h b/drivers/usb/gadget/configfs_trace.h
> > new file mode 100644
> > index 0000000..59d73d5
> > --- /dev/null
> > +++ b/drivers/usb/gadget/configfs_trace.h
> > @@ -0,0 +1,167 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
> 
> Wrong copyright notice, right?  I could be wrong, but you might want to
> check...

FYI this is correct.  Qualcomm is currently in transition and some
developers have started sending patches from a @quicinc.com email
address.  New files sent in this manner will be attributed using this
copyright notice (and is approved by our legal team).

Jack
