Return-Path: <linux-usb+bounces-20909-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D72A3EC42
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2025 06:41:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 881F419C52CE
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2025 05:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 599ED1FAC3D;
	Fri, 21 Feb 2025 05:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bH5xVgIP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F554207F
	for <linux-usb@vger.kernel.org>; Fri, 21 Feb 2025 05:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740116510; cv=none; b=szONHyS8dWPj6oOgo+lOeNm44foNAa2+rSEr9wcIrYNj+8OZi4cUfNw2/YVKQ/iVCi5J2LD7ciWa7OcoYPzyMpnMnbJOXJLSAR0BkL8aLEob+ffb7V+KNHWd1Kg0CtiMzxXaQAs5tIJVDGZjBPoDFDvxZT9lw/vLjz/wZ3xUw8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740116510; c=relaxed/simple;
	bh=9mFPT0zardVjurhakYH9xObWD5z9Cg0EUGS2utClS/c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mubK+pr5glkBPlJIK9eOJ7FzzRFeBVrtv0JKtOlm7lSPw/5Jg+ByT9/spWUnMQqT0jbxkgds+TgZ7Ztodc5CgPop7y+TL1HWjW9ki5ek1CX2B1RxQFV7INFQILhPXlOPWemjY0KvhhblvgQYuxBckB7ghIwPgawphG5hF7ILPNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bH5xVgIP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6313C4CEE2;
	Fri, 21 Feb 2025 05:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740116510;
	bh=9mFPT0zardVjurhakYH9xObWD5z9Cg0EUGS2utClS/c=;
	h=From:To:Cc:Subject:Date:From;
	b=bH5xVgIPF4Zrj/M/YvjOIgfi3bcRMCBjOk8l1Vre8FdwEyd20gXaSxaPq3FVQjq0U
	 l91e26K1Opc1Bd7u5Rh+y438hltJbbXrP01nhB9yW+0+TwFw6V+Y8sSpj9U2/ILhUB
	 PPcdjpVX+W0stw9lWRpOpbY4GT6meRHFpFVLIp/rXfAZ/wb8WvA7TFPLM05rbmAjv5
	 bpk0c4yH86qXlUBisS/PLL7qXsPKZEURo2IcLKqlR+2zXqCZUqCHVktBvN8iq6dQju
	 NRLaewnNCHSjBZJPjaOsQ4mjoGJXOHwNIhHLRFLYuZWhE7sSVxzImJXRMc3u5sEXg/
	 OCMELzTwYt/QA==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	ajayg@nvidia.com,
	gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 0/2] ucsi_ccg: Compat with non-NVIDIA
Date: Thu, 20 Feb 2025 23:40:02 -0600
Message-ID: <20250221054137.1631765-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

On some non-NVIDIA machines ucsi_ccg will probe and show errors
because of not having some NVIDIA specific device properties.

Avoid showing this error and adjust the behavior for the sysfs
file related to it.

Mario Limonciello (2):
  ucsi_ccg: Don't show failed to get FW build information error
  ucsi_ccg: Don't show non-functional attributes

 drivers/usb/typec/ucsi/ucsi_ccg.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

-- 
2.43.0


