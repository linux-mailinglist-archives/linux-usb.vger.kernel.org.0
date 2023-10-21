Return-Path: <linux-usb+bounces-2037-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6497D1C98
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 12:52:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB6121F21CC4
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 10:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F6CDDC2;
	Sat, 21 Oct 2023 10:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bvtPBpZi"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCC3DDA7
	for <linux-usb@vger.kernel.org>; Sat, 21 Oct 2023 10:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7B14C433C8;
	Sat, 21 Oct 2023 10:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697885552;
	bh=1/sqY5ouFW77ZgAiX7qtgL224gkKvkoR4+se6FLQZ7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bvtPBpZiw3X9UCfUJlXb6NqGxYSwl++0OUWk17um8ZcdnKaITnt//xDuC2WjkArbk
	 zA2//vny6CyaePnLyKYBAuNiOPcIYJkd+pePDf3Ayz7UzT1lfG9EUzCkDo0jBWjibF
	 R/MFY0A+HoxOMO4g7i6LsweMpQwmuHctqXJ1Tszg=
Date: Sat, 21 Oct 2023 12:52:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Badhri Jagan Sridharan <badhri@google.com>
Cc: linux@roeck-us.net, heikki.krogerus@linux.intel.com, kyletso@google.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	rdbabiera@google.com, amitsd@google.com, stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: tcpm: Fix sink caps op current check
Message-ID: <2023102103-porthole-viscous-340c@gregkh>
References: <20231015035838.2207567-1-badhri@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231015035838.2207567-1-badhri@google.com>

On Sun, Oct 15, 2023 at 03:58:38AM +0000, Badhri Jagan Sridharan wrote:
> TCPM checks for sink caps operational current even when PD is disabled.
> This incorrectly sets tcpm_set_charge() when PD is disabled.
> Check for sink caps only when PD is enabled.
> 
> [   97.572342] Start toggling
> [   97.578949] CC1: 0 -> 0, CC2: 0 -> 0 [state TOGGLING, polarity 0, disconnected]
> [   99.571648] CC1: 0 -> 0, CC2: 0 -> 4 [state TOGGLING, polarity 0, connected]
> [   99.571658] state change TOGGLING -> SNK_ATTACH_WAIT [rev3 NONE_AMS]
> [   99.571673] pending state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED @ 170 ms [rev3 NONE_AMS]
> [   99.741778] state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED [delayed 170 ms]
> [   99.789283] CC1: 0 -> 0, CC2: 4 -> 5 [state SNK_DEBOUNCED, polarity 0, connected]
> [   99.789306] state change SNK_DEBOUNCED -> SNK_DEBOUNCED [rev3 NONE_AMS]
> [   99.903584] VBUS on
> [   99.903591] state change SNK_DEBOUNCED -> SNK_ATTACHED [rev3 NONE_AMS]
> [   99.903600] polarity 1
> [   99.910155] enable vbus discharge ret:0
> [   99.910160] Requesting mux state 1, usb-role 2, orientation 2
> [   99.946791] state change SNK_ATTACHED -> SNK_STARTUP [rev3 NONE_AMS]
> [   99.946798] state change SNK_STARTUP -> SNK_DISCOVERY [rev3 NONE_AMS]
> [   99.946800] Setting voltage/current limit 5000 mV 500 mA
> [   99.946803] vbus=0 charge:=1
> [  100.027139] state change SNK_DISCOVERY -> SNK_READY [rev3 NONE_AMS]
> [  100.027145] Setting voltage/current limit 5000 mV 3000 mA
> [  100.466830] VBUS on
> 
> Cc: stable@vger.kernel.org
> Fixes: 34fde9ec08a3 ("FROMGIT: usb: typec: tcpm: not sink vbus if operational current is 0mA")

This is obviously not a valid git id in Linus's tree, and our tools
reject it :(

thanks,

greg k-h

