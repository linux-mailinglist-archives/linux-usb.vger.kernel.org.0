Return-Path: <linux-usb+bounces-14775-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB1496EE74
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 10:44:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC09928814F
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 08:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D07A158523;
	Fri,  6 Sep 2024 08:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kVkVP5up"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B76156887;
	Fri,  6 Sep 2024 08:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725612256; cv=none; b=XMa4oncA2va2KzjjLduRNbbSnridZRlBxY7bd9THiHNGpVsicfJG3SoRjQmAXuVyrK3IrSHw3XgZaKUsTo8hdBiZEZXGxBgwM7273MdTXwuyDgsDh3Rxdjhf66PRioZHfWPf6AFRBcWhIz4XIMQLl/q5qHU/S6bCptS3UCG5TUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725612256; c=relaxed/simple;
	bh=t81RHMFnsU4NS9oCrvlVW9LYFvCHEf8mT8eSDSv1iNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IyO6ZgezW3FYm03LSXn1+qcwcxBRA8ExmI4+QTygwEckDWa79+eQq7zppPNsl7q+oV0fNMpyesl5UV9QcQzDNyhsSgnYsnZ5OsKmGUHRq0rfdYoLUFYJLvsdEWB1bPPKDvsQDa3tXP3u6oGF/5mYePouXTYKCiXSFLoLisxpp6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kVkVP5up; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 203E7C4CEC4;
	Fri,  6 Sep 2024 08:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725612255;
	bh=t81RHMFnsU4NS9oCrvlVW9LYFvCHEf8mT8eSDSv1iNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kVkVP5upMDkYw9XpwoYvv1ZrZ1TIYn/KSR/Gg4v4VDkT4Je1Ca+DM5QTqepMbY+1e
	 m1swue7YbM/yWkeO3wIiOkHlxhltQFqtPUshBv0YpaMffh/SR0kh8ulgEtYYDQAasx
	 Y1qHdyX+u8eWQWCowIrIwNXemTOipiJR3LdvZa+/tjChaewFtd1q9I59j4IuthVH1x
	 lBhFt+zNhYzwpxcZj48yj5ujp99EB9w7OlrrY1pQBDAQ/5dXyhgHzY+WeVHcoBb0jz
	 RpRxgvRysAnyn4mPPbnWRqGoTCQQd6pO4OfHNXmuPD9jJeoCOP/Ujz/LXN+XACHS6M
	 u2b37+7RwgPiQ==
Date: Fri, 6 Sep 2024 08:44:12 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v5 1/8] platform/chrome: Update ChromeOS EC header for
 UCSI
Message-ID: <ZtrA3FAKgXOm-FzE@google.com>
References: <20240903163033.3170815-1-ukaszb@chromium.org>
 <20240903163033.3170815-2-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240903163033.3170815-2-ukaszb@chromium.org>

On Tue, Sep 03, 2024 at 04:30:26PM +0000, Łukasz Bartosik wrote:
> From: Pavan Holla <pholla@chromium.org>
> 
> Add EC host commands for reading and writing UCSI structures
> in the EC. The corresponding kernel driver is cros-ec-ucsi.
> 
> Also update PD events supported by the EC.
> 
> Signed-off-by: Pavan Holla <pholla@chromium.org>

It needs your S-o-b tag at the end.  See [1].

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by

> --- a/include/linux/platform_data/cros_ec_commands.h
> +++ b/include/linux/platform_data/cros_ec_commands.h
> @@ -5012,8 +5012,10 @@ struct ec_response_pd_status {
[...]
>  struct ec_response_host_event_status {
> -	uint32_t status;      /* PD MCU host event status */
> +	u32 status;      /* PD MCU host event status */

Even though ./scripts/checkpatch.pl dislikes it, but please don't do that.
The header is a re-import from EC's repo.  We should try not to be divergent
from the origin too much.

> +/*
> + * Read/write interface for UCSI OPM <-> PPM communication.
> + */

Same reason: it'd be better if it can align to [2].

[2]: https://crrev.com/1454f2e8dac20ca37428744345c1bb4fdec30255/include/ec_commands.h#8055

> +#define EC_CMD_UCSI_PPM_SET 0x0140
> +
> +/* The data size is stored in the host command protocol header. */
> +struct ec_params_ucsi_ppm_set {
> +	u16 offset;
> +	u8 data[];

Same for the u16 and u8.

> +struct ec_params_ucsi_ppm_get {
> +	u16 offset;
> +	u8 size;

Same here.

