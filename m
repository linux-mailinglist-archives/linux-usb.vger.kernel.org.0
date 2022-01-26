Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 753D949C0AA
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 02:21:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235637AbiAZBV5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jan 2022 20:21:57 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:32138 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230030AbiAZBV5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jan 2022 20:21:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1643160117; x=1674696117;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NyUsx+OD6tg91aaYuO+U9AX/J3EuweskVyUqKxwsbi0=;
  b=fwvnnWV7KC4I9/zxcoL4MgIMAIGxG6MY6yLKU9GbmppwFXpb3Tx8Nhin
   OwKjzsxkwPCXK7TDRGxRChUtpwVm2I6qJUaYvoGb7ggw6f0u2jdkLnuaA
   pNLtwMhn22vs/LPngdAY/BCBUvUEMvnITZHMQsUlwmTDro6oER9HHixJ0
   o=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 25 Jan 2022 17:21:56 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2022 17:21:55 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 25 Jan 2022 17:21:55 -0800
Received: from jackp-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 25 Jan 2022 17:21:55 -0800
Date:   Tue, 25 Jan 2022 17:21:54 -0800
From:   Jack Pham <quic_jackp@quicinc.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg KH <gregkh@linuxfoundation.org>,
        Roger Quadros <rogerq@kernel.org>,
        "Michal Nazarewicz" <mina86@mina86.com>
CC:     <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v4] usb: gadget: f_mass_storage: Make CD-ROM emulation
 work with Mac OS-X
Message-ID: <20220126012154.GH3221@jackp-linux.qualcomm.com>
References: <20220124160150.19499-1-quic_jackp@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220124160150.19499-1-quic_jackp@quicinc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 24, 2022 at 08:01:50AM -0800, Jack Pham wrote:
> From: Roger Quadros <roger.quadros@nokia.com>
> 
> Mac OS-X expects CD-ROM TOC in raw format (i.e. format:2). It also
> sends the READ_TOC CDB in old style SFF8020i format. i.e. 2 format bits
> are encoded in MSBs of CDB byte 9.
> 
> This patch will enable CD-ROM emulation to work with Mac OS-X. Tested on
> Mac OS X v10.6.3.
> 
> Signed-off-by: Roger Quadros <roger.quadros@nokia.com>
> Signed-off-by: Jack Pham <quic_jackp@quicinc.com>
> ---
> v4: Updated return length as I had inadvertently applied an earlier version of
>     Roger's patch which had the same mistake [2]

Hi Alan, if this looks fine to you would you please mind providing your
Acked-by again?

Also, if there are no objections, I think this patch can qualify as a
bugfix and I can send a v5 Cc'ed to stable with a Fixes tag of commit
d5e2b67aae79 ("USB: g_mass_storage: template f_mass_storage.c file
created") -- basically this has been around for as long as
f_mass_storage.c itself (if not even before when CD-ROM emulation was
first introduced to the former file_storage gadget).

Thanks,
Jack
