Return-Path: <linux-usb+bounces-18934-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7DD9FF3AA
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jan 2025 11:25:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F9C81882558
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jan 2025 10:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F296647A73;
	Wed,  1 Jan 2025 10:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JLSyjOnh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F40EBA33
	for <linux-usb@vger.kernel.org>; Wed,  1 Jan 2025 10:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735727137; cv=none; b=sV0zD+uqb7s5fv+73d5j2U6vhTPrgf4l+2q0BQdYI/F3F9WSkEguCqIlZYy4+1hqIz/vYQnTT7P3KyPH6eskTt5jDq/rsLF8Wq6TX4ddyxII1fU9CDoNbHW/LxsEbHvzM90msRvPYbjCk8t5XO45ZHESi/N3JWQZTWc5FZ69yIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735727137; c=relaxed/simple;
	bh=r5eRrOOtfFAN9sEAdMEx7jkR6l/E4+MDDQFcCTHmMFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+OiD/Vuaj/Vd/yNxzPQuwyN/1NOyevUdcmuWF7zxZ29Luq+xy+9B3Ehsh0c1uv4WBIraVPSvjDoOlFZCzzL8enAfxtJStv82XOHfUfcG3y2GBd4zBn7zQzqyhtjqYdva8kKui/QYysH0t8sHsLcUp8P2QiBK8Vu/EkdDB47RSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JLSyjOnh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72878C4CED1;
	Wed,  1 Jan 2025 10:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735727136;
	bh=r5eRrOOtfFAN9sEAdMEx7jkR6l/E4+MDDQFcCTHmMFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JLSyjOnh07qcS0Lpc+KPZXwhfDuCxYF/frw36D/hdiWQAnt7/hBqwySygb5VVh4Cn
	 gLn8BS0mDZ+0Cl92mypjQYSGe3Gfi41kvBIcoc+nQKTAJHztZMHYc4oknB7dIzQE/8
	 pNiS9o88RDDu6Au8Kq3AakVbKhu8IhJQHYJXH0pM=
Date: Wed, 1 Jan 2025 11:24:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jate Sujjavanich <jatedev@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: USB and EOL LTS Kernel Advice
Message-ID: <2025010134-acetone-blazing-c9b2@gregkh>
References: <CAPphmgY-bj6KzdEgKMg3JXyaSHNn643Th8wBoJjApQUx1F1pUQ@mail.gmail.com>
 <2025010114-quicken-quickly-0411@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025010114-quicken-quickly-0411@gregkh>

On Wed, Jan 01, 2025 at 11:18:51AM +0100, Greg KH wrote:
> On Tue, Dec 31, 2024 at 09:59:45AM -0500, Jate Sujjavanich wrote:
> > I have a device running the 4.19 LTS kernel which just went end of
> > life. It has some USB signal integrity issues which result in "clear
> > tt" loops until the bus can recover (if it can). This can result in
> > system hangs including with lsusb.

Also, this really sounds like a hardware issue, right?  Why do you think
this is a software issue?  For USB, there's only so much the kernel can
do when you have bad signals or electrical connections.

Try running a more modern kernel and see if that helps, otherwise, I
recommend fixing the hardware issues first :)

thanks,

greg k-h

