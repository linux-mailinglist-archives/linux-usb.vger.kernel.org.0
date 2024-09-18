Return-Path: <linux-usb+bounces-15212-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FC197B7F9
	for <lists+linux-usb@lfdr.de>; Wed, 18 Sep 2024 08:33:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9AD99B263DE
	for <lists+linux-usb@lfdr.de>; Wed, 18 Sep 2024 06:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CBA615F41F;
	Wed, 18 Sep 2024 06:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WS++DJSH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7465156250;
	Wed, 18 Sep 2024 06:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726641178; cv=none; b=jwnsPZSKJ7H1QVeM2X573PmAAKRzisycWlfr8rHSRhghYTyM2uDpK9pxv1xGKR+KzGdGitpGKIQ9oQ04pU2AO4SFtCX6MNZZrB1WYrV2NLmoTxoIA5aE1mujRLfC+NNEKzrmB9uyh1h1qHOFayC/aa1Vyvk9X0nRHddt7SU5AFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726641178; c=relaxed/simple;
	bh=bdY2oRbFUsJMSfydNZV+udNA/uUfcDC0GM+JSVjxcnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ULV6hEnXYxuNumSlf9vkMW51CXcbnqQqifCvqjH2mYzWw3JOI7VP3hRLVsdtWwfei3U3+/ZpA6ulRU9+wx6sKW0H4k+LqjjbUaf/C0AAbPITtHv3zL75uEqkvbaCPLnRZE96PJCT058i6FRnvmSNukLbl2i2Ctb845G3wOgOCzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WS++DJSH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73E5BC4CEC3;
	Wed, 18 Sep 2024 06:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726641178;
	bh=bdY2oRbFUsJMSfydNZV+udNA/uUfcDC0GM+JSVjxcnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WS++DJSHcCPY/UlAXdKaANI/57tz5LIXgWwP58koFUD6Fa1zRYCt5cuA072Q8cPne
	 VGoZrkn576PWCFkqM9VBsWQEUGAMdZ1rZY2lrOMO/fukB1keWNe2whv4bZw3gXzd9D
	 LOnxrxOqvq42ckOOMD9dCL6CFkp9lLDS48xDAebO7sIm28ATigrHzPc9C8LVRD2Wbh
	 oeqZzPchBLRY9q7XcEDEy65lm45pT5OAvY+UjxkOT9CAj7jIYn3HHAmeZx796w1XqS
	 7Hm5BCWoZdXREiQPjPvm4Cnq7rL7ZUANf5lbWPcZMOh4WiYNzfumbuFMRvSqd1DirT
	 H7nD4gj/5zKeg==
Date: Wed, 18 Sep 2024 06:32:54 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v6 2/8] platform/chrome: Update EC feature flags
Message-ID: <Zup0FgL8-J1-S1co@google.com>
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

On Tue, Sep 10, 2024 at 10:15:21AM +0000, Łukasz Bartosik wrote:
> From: Pavan Holla <pholla@chromium.org>
> 
> Define EC_FEATURE_UCSI_PPM to enable usage of the cros_ec_ucsi
> driver. Also, add any feature flags that are implemented by the EC
> but are missing in the kernel header.
> 
> Signed-off-by: Pavan Holla <pholla@chromium.org>
> Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>

Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>

