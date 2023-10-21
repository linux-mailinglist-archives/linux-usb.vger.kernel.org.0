Return-Path: <linux-usb+bounces-2036-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D8B7D1C95
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 12:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A79C8B214CE
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 10:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C68F5DDA7;
	Sat, 21 Oct 2023 10:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NstxjAaM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2493A23D3
	for <linux-usb@vger.kernel.org>; Sat, 21 Oct 2023 10:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47EF6C433C8;
	Sat, 21 Oct 2023 10:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697885506;
	bh=Fg640wx54tMtPfiRC5yJ/+rN6QS6OgMeInT9QaJ00Yk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NstxjAaMCut5TlWkZz6vZf157SUSRwZdMITRlxTCW6xOBEDh/b1zJNZ8q2l1mA5bx
	 ZNo29MQWDA4TLNisNVw4ntgAH7vmEe+ivfEmBWZfKdN3LVgPFsWWzPXTjEpcGc1f6S
	 TAV/ks3WtjPVqnXtfpTniZjRnjkKDtAS8+hyK+/8=
Date: Sat, 21 Oct 2023 12:51:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: RD Babiera <rdbabiera@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, badhri@google.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: altmodes/displayport: verify compatible
 source/sink role combination
Message-ID: <2023102114-vanilla-feisty-14b7@gregkh>
References: <20231018203408.202845-2-rdbabiera@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018203408.202845-2-rdbabiera@google.com>

On Wed, Oct 18, 2023 at 08:34:09PM +0000, RD Babiera wrote:
> DisplayPort Alt Mode CTS test 10.3.8 states that both sides of the
> connection shall be compatible with one another such that the connection
> is not Source to Source or Sink to Sink.
> 
> The DisplayPort driver currently checks for a compatible pin configuration
> that resolves into a source and sink combination. The CTS test is designed
> to send a Discover Modes message that has a compatible pin configuration
> but advertises the same port capability as the device; the current check
> fails this.
> 
> Verify that the port and port partner resolve into a valid source and sink
> combination before checking for a compatible pin configuration.
> 
> ---
> Changes since v1:
> * Fixed styling errors
> * Added DP_CAP_IS_UFP_D and DP_CAP_IS_DFP_D as macros to typec_dp.h
> ---

Git stops the changelog at the first "---", so everything below:

> Fixes: 0e3bb7d6894d ("usb: typec: Add driver for DisplayPort alternate mode")
> Cc: stable@vger.kernel.org
> Signed-off-by: RD Babiera <rdbabiera@google.com>

Is dropped, which is not what you want (did you try applying this
yourself?)

As the documentation describes, please put the change information that
you have here below this line:

> ---

So that it will not show up in the changelog.

Please fix up, add the reviews that you got, and submit a v3, as I can't
take this one as-is :(

thanks,

greg k-h

