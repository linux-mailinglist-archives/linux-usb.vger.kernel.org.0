Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B593112B7
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2019 07:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726209AbfEBFt1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 May 2019 01:49:27 -0400
Received: from mail2.skidata.com ([91.230.2.91]:3041 "EHLO mail2.skidata.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725763AbfEBFt1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 2 May 2019 01:49:27 -0400
X-Greylist: delayed 429 seconds by postgrey-1.27 at vger.kernel.org; Thu, 02 May 2019 01:49:25 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1556776188; x=1588312188;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=DNGA8ATHNl4B4R/J0+gK5wAt9PyZIJ+FJHVtdG/h1EY=;
  b=G3UXYcRXReEFcYySJ4B3AFORt/HSy989mq5XaGGtiyit7mpJaaZhHhvT
   XH9JjSGvHANMlntqDeOQPSkq6u3nMtnkB4pw0HTQCURclRxdYat2IL/Fv
   VHTLkbdxfy6Cb9ChITEf7ZQn3VU48j+dRy5EM1+TEYtt5d/EOHnQfdY6h
   5aNPQwJtB22mTBWemN8HcZ1ju2aWG1U9LPbUt+wG7ap/GlAkJJEKuMWKD
   G7V4cOlqV6J/b6taRlrBskV+x4Mj+zSLgxkhQPoppabY/CBVNOEkK9aVt
   qhmNV+aUGgIVlSGP2kZ4evnmrwcIKxCumtO4P6LkLtrWf+NUxjUDvEGgU
   Q==;
IronPort-SDR: xVpp3a9aOjNH8p9JpbhSs//rKufQHh423dPnYArVL9epL0F9J2XWzdu/1JBqtBih30w2Us3iDq
 hce+ofIfnbFjgxpfybAtlCBb0aHJh91rkZhWTPLy0+thDVEiXNCgBvv/Q9ULBFX+C2u5N6RZft
 Dqu4n1csxc42dDE3ON12m2/heU9ZtSELqxHzOwm/nrYubn5yabXt3EcVVnUsm2ntHINp4RwCKq
 FWIjpagulCba6Y4q0g1L+1s3TlaZiZ7EkbXfuw1aWZRD8FvyWmORiGiESCFGNKyhyQEAGFBSnn
 DeA=
X-IronPort-AV: E=Sophos;i="5.60,420,1549926000"; 
   d="scan'208";a="2117529"
Subject: Re: [PATCH 1/3] usb: usb251xb: Add US lanes inversion dts-bindings
To:     Serge Semin <fancer.lancer@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     Serge Semin <Sergey.Semin@t-platforms.ru>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20190424211208.17499-1-fancer.lancer@gmail.com>
 <20190424211208.17499-2-fancer.lancer@gmail.com>
From:   Richard Leitner <richard.leitner@skidata.com>
Message-ID: <238927ae-c2c3-dcb5-b6c2-824fbf127759@skidata.com>
Date:   Thu, 2 May 2019 07:42:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190424211208.17499-2-fancer.lancer@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex5srv.skidata.net (192.168.111.83) To
 sdex5srv.skidata.net (192.168.111.83)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 24/04/2019 23:12, Serge Semin wrote:
> Since a separate US ports lanes polarity inversion property is going to
> be available the bindings doc-file should be updated with information
> about swap-us-lanes bool property, which will be responsible for it.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> ---
>   Documentation/devicetree/bindings/usb/usb251xb.txt | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 

Acked-by: Richard Leitner <richard.leitner@skidata.com>
