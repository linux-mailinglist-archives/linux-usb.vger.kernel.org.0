Return-Path: <linux-usb+bounces-4027-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E631880E934
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 11:34:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2462A1C20A91
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 10:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7C8446A5;
	Tue, 12 Dec 2023 10:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tq+gfTyP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08551805F
	for <linux-usb@vger.kernel.org>; Tue, 12 Dec 2023 10:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6D60C433C8;
	Tue, 12 Dec 2023 10:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702377271;
	bh=m4hWg+HFMSgssUvL0swJXwkGcvdq+HSErd9/g6vrolQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tq+gfTyPeeXVSHWLzmFpHvI8FXiLyHdZ0lwg/n7OTYXlF1WfDAO8LkimtNzqHP2ul
	 hf53bCtUHJhqpP6EIvEzYY+XyUeIMzRu1NcWGQQDiIL/4cx2tUCu1DJomgdV1sJCoi
	 Hg4b5pTwqkIneYUnlkszFzmtr2yhX1KWAHaSG/+k=
Date: Tue, 12 Dec 2023 11:34:28 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt fixes for v6.7-rc6
Message-ID: <2023121221-stark-brilliant-1100@gregkh>
References: <20231212085604.GE1074920@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212085604.GE1074920@black.fi.intel.com>

On Tue, Dec 12, 2023 at 10:56:04AM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 2cc14f52aeb78ce3f29677c2de1f06c0e91471ab:
> 
>   Linux 6.7-rc3 (2023-11-26 19:59:33 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.7-rc6

Pulled and pushed out, thanks.

greg k-h

