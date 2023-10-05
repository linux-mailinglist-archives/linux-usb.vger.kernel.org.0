Return-Path: <linux-usb+bounces-1160-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5C47BA9D1
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 21:12:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 7A613281F92
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 19:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2D2F4122B;
	Thu,  5 Oct 2023 19:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Icl9Znxh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B8729422
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 19:12:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A1BC433C7;
	Thu,  5 Oct 2023 19:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696533157;
	bh=Tw3qLeOmMTt4rHHH7mPpiRpz5PuKOiA4vb2uC+WvlSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Icl9ZnxhNZ9axTPJ3rWpt9hqEoZ+gCF3stfdVpGBe28IfMgSRmTEcD0/FFy7zNbYy
	 6s5a95iVYvRJKKiymeDldptrrUTfM8XaBBYTF3yyt8uSDA24cd33VnGJ8+APELmOFd
	 YYWLV/y+lDT7j7tSOEVme9yDD11LN277GErCzu0Y=
Date: Thu, 5 Oct 2023 21:12:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Alex Deucher <alexander.deucher@amd.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 2/2] Revert "drm/amd/pm: workaround for the wrong ac
 power detection on smu 13.0.0"
Message-ID: <2023100547-vitamins-detergent-4d18@gregkh>
References: <20231005175230.232764-1-mario.limonciello@amd.com>
 <20231005175230.232764-3-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005175230.232764-3-mario.limonciello@amd.com>

On Thu, Oct 05, 2023 at 12:52:30PM -0500, Mario Limonciello wrote:
> This reverts commit 0e5e1a84f0b8c814d502a135824244127fed8f23.
> 
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

No explaination as to why this needs to be reverted?  And does this need
to be backported anywhere?

thanks,

greg k-h

