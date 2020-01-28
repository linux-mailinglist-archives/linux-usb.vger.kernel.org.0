Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2295914BCD5
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2020 16:28:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbgA1P2V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jan 2020 10:28:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:35116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726391AbgA1P2V (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Jan 2020 10:28:21 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 46782207FD;
        Tue, 28 Jan 2020 15:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580225300;
        bh=PQHnL6aU/KfqN7PEUbK2n33KLsCnNyWL05OqeO6lBn4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Jsskb7ILBAwlgTuG3MlnGlxigTi0HH8XpIm9EUmLnYeLRt0kXU0CghSGRnsDelofj
         xnqTcH3sT9FYnvkdiD923daXUZVkcHTZhtBpMkdGy2QqviQGfsQW2Detu96t6ERoIT
         /A3skskvqGAo+paVd5kg7TFGn8Mer7BbscVkmr54=
Date:   Tue, 28 Jan 2020 16:28:18 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Cc:     Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND][PATCH 1/2] dt-bindings: usb: add non-removable-ports
 hub property
Message-ID: <20200128152818.GB3437093@kroah.com>
References: <20200124152504.23411-1-mans@mansr.com>
 <20200127153506.GA4589@bogus>
 <yw1xy2tsvnww.fsf@mansr.com>
 <20200128134745.GA3048749@kroah.com>
 <yw1xpnf3vchs.fsf@mansr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yw1xpnf3vchs.fsf@mansr.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 28, 2020 at 03:15:11PM +0000, M�ns Rullg�rd wrote:
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> 
> > On Mon, Jan 27, 2020 at 04:56:15PM +0000, M�ns Rullg�rd wrote:
> >> Rob Herring <robh@kernel.org> writes:
> >> 
> >> > On Fri, Jan 24, 2020 at 03:25:03PM +0000, Mans Rullgard wrote:
> >> >> Add a non-removable-ports property that lists the hardwired downstream
> >> >> ports of a hub.  Although hubs can provide this information, they are
> >> >> not always configured correctly.  An alternate means of indicating this
> >> >> for built-in USB devices is thus useful.
> >> >> 
> >> >> Signed-off-by: Mans Rullgard <mans@mansr.com>
> >> >
> >> > I reviewed this already, but since you didn't add my reviewed-by, I'm 
> >> > looking at it again and having 2nd thoughts.
> >> >
> >> >> ---
> >> >>  Documentation/devicetree/bindings/usb/usb-device.txt | 4 ++++
> >> >>  1 file changed, 4 insertions(+)
> >> >> 
> >> >> diff --git a/Documentation/devicetree/bindings/usb/usb-device.txt b/Documentation/devicetree/bindings/usb/usb-device.txt
> >> >> index 036be172b1ae..92d863cc96b6 100644
> >> >> --- a/Documentation/devicetree/bindings/usb/usb-device.txt
> >> >> +++ b/Documentation/devicetree/bindings/usb/usb-device.txt
> >> >> @@ -66,6 +66,10 @@ Required properties for host-controller nodes with device nodes:
> >> >>  - #size-cells: shall be 0
> >> >>  
> >> >>  
> >> >> +Optional properties for hub and host-controller nodes:
> >> >> +- non-removable-ports: list of hardwired downstream ports
> >> >
> >> > If you have a hardwired device and need to know that, doesn't that imply 
> >> > there's some other stuff you need to describe beyond what a standard USB 
> >> > device has. Such as a power supply that's not Vbus from the hub.
> >> 
> >> I suppose there could be, but there isn't in my actual situation.
> >> 
> >> > At a minimum, I think this should be a per port property.
> >> 
> >> That's what I suggested first.  Greg told me to do it like this instead.
> >
> > I said that?  I do not remember discussing this at all, when did that
> > happen?
> 
> https://lore.kernel.org/lkml/20190228155241.GC12050@kroah.com/

Almost a full year ago!  Hah, I can't remember what I wrote last week.
