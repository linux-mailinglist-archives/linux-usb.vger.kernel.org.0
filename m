Return-Path: <linux-usb+bounces-21768-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EDCA6117D
	for <lists+linux-usb@lfdr.de>; Fri, 14 Mar 2025 13:37:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFF433B2E25
	for <lists+linux-usb@lfdr.de>; Fri, 14 Mar 2025 12:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506911FECAB;
	Fri, 14 Mar 2025 12:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vbIQgj8T"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66BC1FDA89;
	Fri, 14 Mar 2025 12:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741955842; cv=none; b=tzQGauUusfZkAJArMLBCz3nU69g4SoRU+w1ai6/lhJux9oXpNrqpHYGxTk7GvEAwUte+/yK0qtd/6Z0Gpxtj5koi6guUN8HpizNmv2m70DcGxIow6hnfe+SQcqQ4P566ZM8/wVAhHhCz4JNWWJsJDJ0jRL4Y/EQ0eq00z9r3mmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741955842; c=relaxed/simple;
	bh=S3esJdqF5lpQHu09B96cKlik0uJVTaNez4lDgMbLHPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p6RDR0echJv1zWis2+e/lRHpRyhWnZcZNG/1Zdlt6PlJt6ujfo0KW7bq0vZIgd0VmP+v8alC46HT8z00FyfGsx1/62bAIClXaisS8ilnoXZlE46W1LvExpSZ7NmSX72HPGpJnLq6Xiua5zk68O1l40OJFYZ8sKzgenJitlAzFxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vbIQgj8T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99125C4CEEB;
	Fri, 14 Mar 2025 12:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741955842;
	bh=S3esJdqF5lpQHu09B96cKlik0uJVTaNez4lDgMbLHPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vbIQgj8TSE4lQeZ2PT7fb2JoEj93MnLv3QU989Xgjmisv8UwUYj8PXvwPkzjVymog
	 8gWijKRL0MImk406Plv157O/N55Rr5qeNPMS2pATpUslbkUSDMH5p2NdLlCUTJXPsN
	 lhnzmeihtIy4WezdZjx3RjsYqhE8uPUVy4eVz4jY=
Date: Fri, 14 Mar 2025 13:37:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v5 0/6] add USB2.0 support for i.MX95-19x19 EVK board
Message-ID: <2025031404-elite-critter-05b7@gregkh>
References: <20250312082700.260260-1-xu.yang_2@nxp.com>
 <2025031443-rounding-subject-1f60@gregkh>
 <20250314092137.6m3gmj4irxqwpy22@hippo>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314092137.6m3gmj4irxqwpy22@hippo>

On Fri, Mar 14, 2025 at 05:21:37PM +0800, Xu Yang wrote:
> Hi Greg,
> 
> On Fri, Mar 14, 2025 at 09:18:51AM +0100, Greg KH wrote:
> > On Wed, Mar 12, 2025 at 04:26:54PM +0800, Xu Yang wrote:
> > > The i.MX95-19x19 EVK board features a USB 2.0 Type-A port, with this
> > > series primarily introducing USB 2.0 support. In the i.MX95 architecture,
> > > the USB wake-up handling mechanism is integrated within the HSIO block
> > > control module, utilizing a dedicated wake-up interrupt. Therefore, we
> > > also implemented corresponding wake-up logic code to properly manage this
> > > functionality.
> > > 
> > > For detailed changes can refer to patch commit log.
> > 
> > Does not apply to my tree :(
> 
> It'd due to below dts patch #2,3 not in usb tree. However, linux-next already
> have them. I see Shawn just send pull request for 6.15. To make it easy,
> let me ping you when usb tree have them, is it ok?
> 
> https://lore.kernel.org/linux-usb/20241204050907.1081781-1-xu.yang_2@nxp.com/#t

That will not be until after 6.15-rc1 is out.

thanks,

greg k-h

