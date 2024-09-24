Return-Path: <linux-usb+bounces-15371-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 384A2984C3E
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2024 22:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 694FE1C22BB3
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2024 20:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 213CF13B783;
	Tue, 24 Sep 2024 20:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SV0NnI5C"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA0E13B284
	for <linux-usb@vger.kernel.org>; Tue, 24 Sep 2024 20:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727210416; cv=none; b=UwI1KbgJI0uC9nD6m3femd/1csbGcgW9aARG1nXQHPxjQW0sPPE+cbFzv5FgKnAj/HtyURKxuQfD2JPHTfdl7Z4kD7jfkhAS7mq0iQeYR6O/152P25hMUunr2N5z2bxXPc+qVaapY5+qv1p5Oxw3DHHZofdwNOMwq/iSCWdqlkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727210416; c=relaxed/simple;
	bh=aZdy7ZQYmVo/YEWE7+SyhIQTn5iaW5K7aQ3NuHmfzK4=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=M0RVLmVScIoquWl18sbF5+AD0tJD5FmR/35XLIybRpdMSo9xTJ8pyNE/4PtDAMPjJK4BPGVxVIfw1YCr+LStCjT8hkUjfCfxjQayYzlCztB+Hc4KBDbxOPZzbclgf7nIYLai6x4K81bo3esGPHloGPvQopsDRpbB+8fgLMmnNwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SV0NnI5C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8F1C4CEC4;
	Tue, 24 Sep 2024 20:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727210416;
	bh=aZdy7ZQYmVo/YEWE7+SyhIQTn5iaW5K7aQ3NuHmfzK4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=SV0NnI5Cj3jpnoLUvjGIIbW9nEbnl9W7HTA6pWGEJI965UygsHiGI+pG5y510F9fm
	 LZsIg91nGQuFXjNpQ6xLcqUpNl7XhbASyaVjAaQns2QqLytcdT6k90yXaZmPe/rva/
	 cilpn9aQxmINHT5X1vo/Rmjq5KFK4F2+cAs3uObJ5WMqUE8RHsCCyS7/iD+IpHOAow
	 bXPf9iemo/EqvrXzMwil0JLNqIqqAcMNsWzyBR2eMsHRwWxL7g/+VpuBc2ylla65oL
	 oB/YescnmoeztIUqrtqEWKE2GnqrwFXZTcUC2C5GblFnv0QmoTlrTIt3aooQPdPJWn
	 42RoEXBzW5gSQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B62263806656;
	Tue, 24 Sep 2024 20:40:19 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: helpdesk@kernel.org, wangbinghui@hisilicon.com, 
 linux-usb@vger.kernel.org, konstantin@linuxfoundation.org
Message-ID: <20240924-b219316-3c914c5fe403@bugzilla.kernel.org>
In-Reply-To: <20240924-meaty-tangerine-guillemot-b8edca@lemur>
References: <20240924-meaty-tangerine-guillemot-b8edca@lemur>
Subject: Re: Bouncing maintainer: Yu Chen
X-Bugzilla-Product: kernel.org
X-Bugzilla-Component: Helpdesk
X-Mailer: bugspray 0.1-dev
Date: Tue, 24 Sep 2024 20:40:19 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=219316

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


