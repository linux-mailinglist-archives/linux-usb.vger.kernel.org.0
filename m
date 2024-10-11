Return-Path: <linux-usb+bounces-16068-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 621FA999DE6
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 09:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12ACF1F23A81
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 07:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC1020A5C4;
	Fri, 11 Oct 2024 07:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DELn5gXv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDD3209F50;
	Fri, 11 Oct 2024 07:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728631677; cv=none; b=fNC9JTJYgKZGH4n01oisDlbrRmL4oTLZzyCzbhub2t19BRFbImcC0QGiDVEL83Q2//I2lZjRvDBx+lPwizaKspKCYp6hcB3lzx4et+Fq3JrVpYMtNKPFDusAg0fJRCZwigteWOwOfnEjBfau5CmZQPaXiw445UThNmN7eZOTvIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728631677; c=relaxed/simple;
	bh=OOFO4lSn3+gCwkhG8/pmHr3TXdyLzifBQVHNU+fKaOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iAuiMCNNcr6D7ot46iH3Ulb5QHO3L3KKH9WJu2t+DGyGNqmMh/3ICrv3t4pmwm5lwbj2Gs5P7MXVem0WH0M2lexo80+67yoyBEivPWpyV/NudUUE0uNlviP5kU0lsV1BInOGbUVj7HRjj7rdIUbZ/Tr99Cx3yru9nc7gfNmoLN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DELn5gXv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51DADC4CEC3;
	Fri, 11 Oct 2024 07:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728631677;
	bh=OOFO4lSn3+gCwkhG8/pmHr3TXdyLzifBQVHNU+fKaOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DELn5gXvvLGtUQiRs9e9pHKXRmAJMFjMlOGw2guBRMyFGMmhlXQ3HMDofeqFOspCN
	 l2WIOpdvTlJghmuydQpGWPfcz7PmYx57mqpyOXK38h2FTgxy+Nih/gOlUpIOgACFLB
	 fhVZcA9D7fNw1vGOKsSg2BhIi/47Fn8hhXJTPb3/euO/M4DlrK9Ntp6KAj1IcbJqVj
	 JieId+fklEy68mgnbAuljyUMt7QBtx9CmTnLlSyFskqfa66dmbRNZyIYnF9OTGGBqT
	 UamHk1F2LW3kC8O67tfCz81iaJR8phHj3elzgWfJOZDdYhDSQ3YIyuL3HulIMtdVRo
	 PQ4NfDhp9FQ6A==
Date: Fri, 11 Oct 2024 08:27:52 +0100
From: Lee Jones <lee@kernel.org>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v6 2/8] platform/chrome: Update EC feature flags
Message-ID: <20241011072752.GL661995@google.com>
References: <20240910101527.603452-1-ukaszb@chromium.org>
 <20240910101527.603452-3-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240910101527.603452-3-ukaszb@chromium.org>

On Tue, 10 Sep 2024, Łukasz Bartosik wrote:

> From: Pavan Holla <pholla@chromium.org>
> 
> Define EC_FEATURE_UCSI_PPM to enable usage of the cros_ec_ucsi
> driver. Also, add any feature flags that are implemented by the EC
> but are missing in the kernel header.
> 
> Signed-off-by: Pavan Holla <pholla@chromium.org>
> Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
> ---
>  .../linux/platform_data/cros_ec_commands.h    | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)

Looks as though this is only used in the MFD patches which breaks
without them.  Can I take it without sending out a PR please?

-- 
Lee Jones [李琼斯]

