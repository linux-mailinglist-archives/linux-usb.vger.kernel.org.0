Return-Path: <linux-usb+bounces-2254-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 383737D942E
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 11:50:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCCACB213CE
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 09:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D4BE168D5;
	Fri, 27 Oct 2023 09:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SyQzndBx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EF9FBE3
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 09:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 770F1C433C8;
	Fri, 27 Oct 2023 09:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698400240;
	bh=6b8ULFcBXte8Rw1ebTPNCNKOgCZeuG3tXXh4ggnj304=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SyQzndBxyoQ3cEl54shnbZ+rB1kR4x1412bbTPhj32kTfjBax/f+/vyfEAxKW0SZM
	 t/7/i5HAUTI1q3NIiUmeWMSj8UeGgNB3sxoZzWJyZ2EKjEmCddxDEd9f1rA8cwQ9AM
	 E8pB3s+qjCxhTKmqKbV8Q8I65bZLFcrzvN2l5++8=
Date: Fri, 27 Oct 2023 11:47:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt changes for v6.7 merge window
Message-ID: <2023102728-stroller-decode-92b3@gregkh>
References: <20231026084405.GJ3208943@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026084405.GJ3208943@black.fi.intel.com>

On Thu, Oct 26, 2023 at 11:44:05AM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:
> 
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.7-rc1

Pulled and pushed out, thanks.

greg k-h

