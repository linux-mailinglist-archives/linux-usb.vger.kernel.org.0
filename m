Return-Path: <linux-usb+bounces-14776-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFE096EE75
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 10:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E95DD1C22EF9
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 08:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFEDE158534;
	Fri,  6 Sep 2024 08:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="enn+DCz/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67404BE6C;
	Fri,  6 Sep 2024 08:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725612279; cv=none; b=eiAqcHkuf4wNIy0DQ5a3bhmGMgPMcW1BgzGbpRI7nGA2+Yc6OL5TCSCevPvWQDG4+suEOg+0PMMhtwVi/kuqzKRTKDTeYOGbScQ018D2/MEbhVuLxU/YBrcD8WHT5wEzuK0bRTexpuymE4Kc/uOXO7/ww4P8dZVDoJqfwdVnbZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725612279; c=relaxed/simple;
	bh=LsbP+G6YCGhSEArvYtEA6D21hf8VHCPCuW84buYYrok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WUEpLJe2v4Muk6vcsV+yr0m9+ui8aeRC2QtqBnu0AESXXV9xQJO5anaKzVPjhapjnDep7y/nJ2fKq5uMtX0OjODJGgALg0LfR56/bIWNVImq6HwEV9CXJYCa42yoaTgpO+YCHfLBsop57Iiw82KokRm+VDzXxYjB34E+NakXZHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=enn+DCz/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53595C4CEC4;
	Fri,  6 Sep 2024 08:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725612278;
	bh=LsbP+G6YCGhSEArvYtEA6D21hf8VHCPCuW84buYYrok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=enn+DCz/B6kvCeRAPEWK9Zw2uRKBorbm41hA1JwzucDA09d1Ca9Pdd8tnhtdRtj0/
	 RTrROSkd6zvCi+VsACwPd/wzMYSRmqTBEGu5AMrBp7eSUsBWo5WDr0MZG3Qfb1xfnV
	 FG4RIPHbtA4jn2UE/Ok9v5mW393lbFrA6uQ3BiIFnfEOIhJyfIjd/dUJqOEzNt4U3h
	 V8IiLJR6A+V7TdAdke8h0BXnb9Pi4rYGE4flOQ7Drak0p04Hs5Pj1RqDu+fLkeMcnF
	 V9FJ8lIaqleMymNNDPA99plk/H9TbfB87g0u4zb+yc79pe+xhqiEI+MamnjMLuF/4b
	 a446aps19iYLQ==
Date: Fri, 6 Sep 2024 08:44:35 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v5 2/8] platform/chrome: Update EC feature flags
Message-ID: <ZtrA8y0266RTm5Z3@google.com>
References: <20240903163033.3170815-1-ukaszb@chromium.org>
 <20240903163033.3170815-3-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240903163033.3170815-3-ukaszb@chromium.org>

On Tue, Sep 03, 2024 at 04:30:27PM +0000, Łukasz Bartosik wrote:
> From: Pavan Holla <pholla@chromium.org>
> 
> Define EC_FEATURE_UCSI_PPM to enable usage of the cros_ec_ucsi
> driver. Also, add any feature flags that are implemented by the EC
> but are missing in the kernel header.
> 
> Signed-off-by: Pavan Holla <pholla@chromium.org>

Same as previous patch, it needs your S-o-b tag at the end.  See [1].

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by

