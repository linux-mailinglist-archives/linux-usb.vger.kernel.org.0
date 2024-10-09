Return-Path: <linux-usb+bounces-15912-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C17D9966B3
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 12:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B98121C220E3
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 10:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 155DE18FC9C;
	Wed,  9 Oct 2024 10:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nv7EkPMz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD9817E003;
	Wed,  9 Oct 2024 10:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728468663; cv=none; b=SOZi8QYwT2jqi5cB3gKUHv/Vwyd4TcQGb6jFxzWrgwzQ0LDsrCCUAu99StBNfzJR/kyczY9XyFm6VyBwhIweKLmiJh2hd7ILrUzj1BWKGHG+w4OpOkToL5bhKo9yxbWWyQIo2AxHqn22ZJe2mUMam+4UL6J3Zs0biASWrB/5QgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728468663; c=relaxed/simple;
	bh=BlkXYf2D/PB18UvCmeu9Pysc7X67MO5amcLXTWx/E7s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KaLcd19v6pIIPbTnu3ImeTkOdHgP13pL1VoK0GtAyLSunad5BpbrXyI+YhPCo4ZGP4B+BkwX13Z1SG0CRu6Ukgfp2fggzsxaIfUL10xsZm5bZdd6QK1tsi4cPuLYF34GR91Qlid2YINgP1qp6cXuiiukQ7bXEGLxMqJAyD0OHNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nv7EkPMz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1965C4CEC5;
	Wed,  9 Oct 2024 10:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728468663;
	bh=BlkXYf2D/PB18UvCmeu9Pysc7X67MO5amcLXTWx/E7s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nv7EkPMzfbzTk74yvCNqKLZjSkYAcGDKg9djV1l6Oy/N8KXbQHj3bTmTK8avKNVRu
	 k1MRX01LFl0W2b0e1aTK+/iu9defdzUhxhMz6TwwCdIpjzknYq3EVITAA4mAEz3ayd
	 Jqxn/f06sODpQbZyStNuA/aeDdPKRFt/0YyJBFpNfa53TgoG6ND7V99wnDGlOyONu1
	 q8qFBvrjKXewX3hhnj6HshZAZo4IhU4pR5siqB1p9CxqpTkma6UTSBMclwVQBQhrJ8
	 eeBWnpIRHKIIlw2wkC3xQj+sOiO0JrcSKOZnY4C0tG+rwQSyfZVA5Ea11m2861nk0M
	 trn2H2wD50TWA==
From: Lee Jones <lee@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
 Pavan Holla <pholla@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 linux-usb@vger.kernel.org, chrome-platform@lists.linux.dev
In-Reply-To: <20240910101527.603452-9-ukaszb@chromium.org>
References: <20240910101527.603452-1-ukaszb@chromium.org>
 <20240910101527.603452-9-ukaszb@chromium.org>
Subject: Re: (subset) [PATCH v6 8/8] mfd: cros_ec: Don't load charger with
 UCSI
Message-Id: <172846866071.473980.2423881892387297339.b4-ty@kernel.org>
Date: Wed, 09 Oct 2024 11:11:00 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Tue, 10 Sep 2024 10:15:27 +0000, Łukasz Bartosik wrote:
> When UCSI is enabled, don't load cros_usbpd_charger and cros_usbpd_logger
> drivers. Charger functionality is provided by the UCSI driver already and
> logging will need to be added.
> 
> 

Applied, thanks!

[8/8] mfd: cros_ec: Don't load charger with UCSI
      commit: 1b11529097cebae663b36b45886600a14f04eaa1

--
Lee Jones [李琼斯]


