Return-Path: <linux-usb+bounces-28780-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A58BA9421
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 14:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D6BD176DF3
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 12:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0C63054FE;
	Mon, 29 Sep 2025 12:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="A5ZO5hXx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DC02FF66A
	for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 12:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759150795; cv=none; b=ohiGnoOXzQK+WFFlJsFkYK2ml8+1v3y3MYnkjYjFj4XkiD1YF9X+E7mjSXJtvzBlhNGtHqGjDqKll+WgOl3WJrpSVF+V/O9pawlLAF/PBDGo4sSz7Tx58bkYhNjHa2c69nf3Y9ykCyAsUK+r5XJTF9sA3MpbfR9TVFwVAAmwL+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759150795; c=relaxed/simple;
	bh=Tik6aYoGgc9CMlSfiFtLfac7PuMsl1Y6OIl6EXMRRJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZrMhxELRxRgibemtSZMmOhaEtI4FFH3/FhgPAkra4XQTtth6Yw5r+ys+3LEI0+blvM13WdDXI6kO7W53atrN2oiiT/x4G7sUD+WbKWKGLciTdo5xUlfzlY8sHsxyuRphLV91qIV7ifbIE8rpcrNLPEK5/34eCJ9hkj2tuLl8SEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=A5ZO5hXx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F4CC4CEF7;
	Mon, 29 Sep 2025 12:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759150794;
	bh=Tik6aYoGgc9CMlSfiFtLfac7PuMsl1Y6OIl6EXMRRJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A5ZO5hXx79p6M37l+dAm4lbHP+jLJIkHrRrdwaqgHk046rmfiTnlkMOUvmQNY8fe8
	 kCcBpkvun49caVVho6fxJwSvahT3PD+rNHazn3xf9j+u46P8cvwFpPxSHqEmK7yA4S
	 dhwFaTxIOPeiTUh5GCc3HOjZSXjZ8fJF6VSQMuVQ=
Date: Mon, 29 Sep 2025 14:59:51 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v1 2/4] xhci: dbc: allow to set serial number through
 sysfs
Message-ID: <2025092917-reference-author-844e@gregkh>
References: <20250929090206.423937-1-ukaszb@google.com>
 <20250929090206.423937-3-ukaszb@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250929090206.423937-3-ukaszb@google.com>

On Mon, Sep 29, 2025 at 09:02:04AM +0000, Łukasz Bartosik wrote:
> From: Łukasz Bartosik <ukaszb@chromium.org>
> 
> Add code which allows to set serial number of a DbC
> device through sysfs.

But why?  Who needs this and what tools will do anything with this
information?

And where is the Documentation/ABI/ entries for all of these new ones?  :)

thanks,

greg k-h

