Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52C7E48902D
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 07:27:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233512AbiAJG1K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 01:27:10 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:38493 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230116AbiAJG1J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jan 2022 01:27:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1641796029; x=1673332029;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bYTzPo9mkxQxwYowlJE9+MKv5Xbp8wvQ4JlIEoAtpYw=;
  b=DmybYw5GpHRFHR246Xt6Fm2C0il3v0nwJywrvq1njhrP7cSADfZ8la4L
   K0jZWtwwMwehxn77bTjhFJe9BaguDetY7xw5XYX43IFr/MJctofXIW3SF
   iFYzE46iFGF5amlC9Z4NNSwR9PIy27cFpVUxkqinwboUiaodKBcQVmh9H
   c=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 09 Jan 2022 22:27:09 -0800
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2022 22:27:09 -0800
Received: from jackp-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 9 Jan 2022 22:27:09 -0800
Date:   Sun, 9 Jan 2022 22:27:07 -0800
From:   Jack Pham <quic_jackp@quicinc.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Roger Quadros <rogerq@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Michal Nazarewicz <mina86@mina86.com>
CC:     <linux-usb@vger.kernel.org>,
        Roger Quadros <roger.quadros@nokia.com>
Subject: Re: [PATCH] usb: gadget: f_mass_storage: Make CD-ROM emulation work
 with Mac OS-X
Message-ID: <20220110062707.GE3221@jackp-linux.qualcomm.com>
References: <20220110062359.5314-1-quic_jackp@quicinc.com>
 <20220110062359.5314-2-quic_jackp@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220110062359.5314-2-quic_jackp@quicinc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jan 09, 2022 at 10:23:59PM -0800, Jack Pham wrote:
> From: Roger Quadros <roger.quadros@nokia.com>
> 
> Mac OS-X expects CD-ROM TOC in raw format (i.e. format:2). It also
> sends the READ_TOC CDB in old style SFF8020i format. i.e. 2 format bits
> are encoded in MSBs of CDB byte 9.
> 
> This patch will enable CD-ROM emulation to work with Mac OS-X. Tested on
> Mac OS X v10.6.3.
> 
> Change-Id: Ifdbe10e779bc8609a11eeab6ab6de549c6223fe2

Argh, sorry about this! Will remove in V2.

