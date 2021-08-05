Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BEE93E0F8E
	for <lists+linux-usb@lfdr.de>; Thu,  5 Aug 2021 09:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236102AbhHEHtu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Aug 2021 03:49:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:56900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232308AbhHEHtt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Aug 2021 03:49:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 32B14610FD;
        Thu,  5 Aug 2021 07:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628149776;
        bh=uMY/yPIZhdKn84VyDd45WzssFi+YvcnO3wfh/yhpjLw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ck+x8v8TnwuWP9X93lUQXZSmaF4On/cPgNx1PNU2AJvVKZe7EglNX5+qzVn49uQ+D
         oXWY+HRAy4QnUubsnXaipU2dOuRuRztrwAIabh4ULfpJywvr95IpTf1zDxh9fGoyPs
         xQlSqvK66rMTu5CeyHyaBV2nfLZzeLlZMjLAlc+rmMcSfpUjJSZNSdcalHkqyQcCxm
         3HnFhI+SVZfYNLauXW6LcVN3/bGT2gxwaw5fgQlcAU+7wR0yihwOx5z/pZa68OTUEO
         Ea+Tz/fxygKg10yblNldp2MQV2FUpQZZVN4FK5HjnhhtyIVYgYqqBY0PyzKyauZvwz
         kZBuc75Q4CLeg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mBY7a-0003Zy-D6; Thu, 05 Aug 2021 09:48:55 +0200
Date:   Thu, 5 Aug 2021 09:48:54 +0200
From:   Johan Hovold <johan@kernel.org>
To:     David Bauer <mail@david-bauer.net>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: ftdi_sio: add device ID for Auto-M3 OP-COM
 v2
Message-ID: <YQuX5n4Lr1ODO0V/@hovoldconsulting.com>
References: <20210804232522.43330-1-mail@david-bauer.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210804232522.43330-1-mail@david-bauer.net>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 05, 2021 at 01:25:22AM +0200, David Bauer wrote:
> The Auto-M§ OP-COM v2 is a OBD diagnostic device using a FTD232 for the
> USB connection.
> 
> Signed-off-by: David Bauer <mail@david-bauer.net>

Applied, thanks.

Johan
