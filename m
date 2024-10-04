Return-Path: <linux-usb+bounces-15687-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0300298FE0C
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 09:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B39C62817D8
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 07:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE0CE13A884;
	Fri,  4 Oct 2024 07:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ui0DErwj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D707F7CA;
	Fri,  4 Oct 2024 07:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728028119; cv=none; b=EjFk7NriFcD9Wrex8XrHjJo0hcrmbVWadFy376uIcY80OZU9vPaQydIloTSGjCjc9GKNluQG7+/gXQ6To0KT/jSNNcsm+cjS2FUl7jHjr275QbSVpFlt68DiBasUPm1LzaNuVgEONVMkd2TCpL5hlLbF7/gUaM4bKcoJ7OkS03o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728028119; c=relaxed/simple;
	bh=rVD2O7+6M7oWZJH7R+ngXoiSamNYBtmL133kwCHpCsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nDe66gxRUykB7tKDvrDi8zAvvCtzQQXqVUxeAfhXKyYHbzKmSHRLZ/M8XvjI1RkylowDfKypE+gsVMr26cyyZQqSrZgI0zEGGqKAWvzjjPjXCsQA9ptusoHANnzzbgqPz3S4r1cWZZlp3T18wsFdhL2SWkMiVzAM2CyRZa17iB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ui0DErwj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 777CAC4CEC6;
	Fri,  4 Oct 2024 07:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728028118;
	bh=rVD2O7+6M7oWZJH7R+ngXoiSamNYBtmL133kwCHpCsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ui0DErwjgXoM5g7QEAd543+mH95jvvvrqKbTF6kJWF+2iwqfazQRDwi2X0q3lCzUz
	 BmMj93Rl3GqaHiIsAVSzSNonq1tmUKTHcTNqMrytTPI2bYty30BhFId+fHceUCHr0S
	 GzVpbwIy71PZSY+3hqvfoUVDDnl8pfvBwKp4YiDk=
Date: Fri, 4 Oct 2024 09:48:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH v2 1/3] xhci: pci: Aling the naming for Cadence PCI ID
 0x0200
Message-ID: <2024100417-graveness-irritably-d31c@gregkh>
References: <20241003121729.3867216-1-andriy.shevchenko@linux.intel.com>
 <20241003121729.3867216-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003121729.3867216-2-andriy.shevchenko@linux.intel.com>

On Thu, Oct 03, 2024 at 03:14:44PM +0300, Andy Shevchenko wrote:
> Rename the PCI device ID to match what's used in another driver.

If the same device id is in multiple drivers, why not add it to
pci_ids.h like is normal to do?

thanks,

greg k-h

