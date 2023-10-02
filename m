Return-Path: <linux-usb+bounces-918-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2417B5104
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 13:16:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 837A3283270
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 11:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB3310A1C;
	Mon,  2 Oct 2023 11:16:45 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAC11118C
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 11:16:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB345C433C7;
	Mon,  2 Oct 2023 11:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696245404;
	bh=HkJHNVjS0pT1awq8HpahWMz/zIza1hDwn2RItLflX3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=08Ags5pYv8wa3v1twzKMVsLfObb8ntH3uBoPreQqP00fzblwVkgcXE33d74jmXHI4
	 TxbUPWHUiDzSQN2pdRokHL/MQa2Wh+pVoq1e6aBQBUONOxuF/WS4DJ1afkd6Sv0syM
	 EZ0vuoOzx1AaZ6YrE4cV1trKA+lDYM2AbZj7KgeM=
Date: Mon, 2 Oct 2023 13:16:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt fixes for v6.6-rc3
Message-ID: <2023100234-trimester-strongbox-a375@gregkh>
References: <20230919054403.GX1599918@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919054403.GX1599918@black.fi.intel.com>

On Tue, Sep 19, 2023 at 08:44:03AM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:
> 
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.6-rc3

Pulled and pushed out, thanks.

greg k-h

