Return-Path: <linux-usb+bounces-35098-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOr4L0iou2mnmQIAu9opvQ
	(envelope-from <linux-usb+bounces-35098-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 08:39:52 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDA72C760C
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 08:39:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0B85E3021989
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 07:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB6603A0E85;
	Thu, 19 Mar 2026 07:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LVCVRpwi"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6AA30F7F3
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 07:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773905989; cv=none; b=neuUuEOPq9GXELKPvkRa42TwyaHmXUMHV/RX1wlz8iMoe8kw9Qt//b3bldWRQW5SH+/H1aW1O11yHuMCYBxp0/wVbDy6Lvukqtwd5yvhH9rQmHKD/WHJKMmychO5VWHbxMd79nr8gzz1b7Mas/pFQ5lyq6idOyRoV87BuBGbja0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773905989; c=relaxed/simple;
	bh=ZjGvQUqOxc3eUpZ0xgQuNwwLNwvuHQKJustTWZAIZxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mseEEw6jOTt/PPH6XoA2CU2kvMmfw3IyiO7caJbTz9/glgaGQvbNvv+CTzkxa0aX0VZRym3Ffq3ViPlKED3ddM1JQloNqwcjRRw7tgd7gqxQnEsqXgfzcQjMIs2avEDSNCf7zhjU8HoF8+mvOTmgYtdKDmk0QgSGlLQ8SgUWNCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LVCVRpwi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE32C19424;
	Thu, 19 Mar 2026 07:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773905988;
	bh=ZjGvQUqOxc3eUpZ0xgQuNwwLNwvuHQKJustTWZAIZxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LVCVRpwiBcXIRIwtq8nENYML7Sju2G5quJ9u61DtyxbwmmEqRJBge64TmHudsKffa
	 JTESHZ6VGXcGxYOn7YAT2ikXJMEe+2lveqm7wCy/tOfAh66tYBWkPWcRhqmH+ldNT5
	 zOvvSNpqmfMAXCgbMAv22q2Fz4bHiTTXPlDeG2+P3WpZtQ8xtT+GRzCW0e9Fjj5kB1
	 m2OYWKMKUgCEUhoX2UGxyNnmnRUoaMGcpqIdRn56DH7zkABPH6ccNtTHvOp9i8bDEE
	 O1s87OUKlGJ9RhLwvcub9KOycupIr8HvOPi3JdHebo12ZeWNHhrweQzvVLmXtQUhaa
	 zp/UnytbFLi9Q==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w37ys-00000000yoL-16vi;
	Thu, 19 Mar 2026 08:39:46 +0100
Date: Thu, 19 Mar 2026 08:39:46 +0100
From: Johan Hovold <johan@kernel.org>
To: Pooja Katiyar <pooja.katiyar@intel.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com, dmitry.baryshkov@oss.qualcomm.com,
	asutosh.pathak@intel.com
Subject: Re: [PATCH 0/3] usb: typec: ucsi: Add support for SET_PDOS command
Message-ID: <abuoQm_XkYizxRU8@hovoldconsulting.com>
References: <cover.1773090896.git.pooja.katiyar@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1773090896.git.pooja.katiyar@intel.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35098-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.993];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3BDA72C760C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 03:25:28PM -0700, Pooja Katiyar wrote:
> This series implements support for UCSI SET PDOS command. It provides
> interface to send message out data and update source or sink
> capabilities PDOs on a connector over debugfs interface.
> 
> Pooja Katiyar (3):
>   usb: typec: ucsi: Add support for message_out data structure
>   usb: typec: ucsi: Enable debugfs for message_out data structure
>   usb: typec: ucsi: Add support for SET_PDOS command

This is really v6 after v5 was reverted:

	https://lore.kernel.org/all/cover.1761773881.git.pooja.katiyar@intel.com/
	https://lore.kernel.org/all/20251222152204.2846-1-johan@kernel.org/

What changed in v6?

Johan

