Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98EB13EEC1D
	for <lists+linux-usb@lfdr.de>; Tue, 17 Aug 2021 14:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236340AbhHQMGo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Aug 2021 08:06:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:34606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236113AbhHQMGm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 17 Aug 2021 08:06:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A2A2060F58;
        Tue, 17 Aug 2021 12:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629201969;
        bh=aZIC33VJ2x7GCGgdG+Rixf5ybEZ3/o8FbhlihxjMcnk=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=qQHYwTNfJnP1ItFAlI0gWyq5gt5DI6gDyw+8T1+rCbSFB0TpkL2eHXkrU5syPx/SM
         4jtc/Wx3psxNPEk4iVVH53iFuL8RyVIl5d/sOXMhUMrMZxXUUm6O4ualRer0cFDZOE
         cUplfa9bUGJkZ0PYXZIvMl/1iz/X/XO/6gA28VzPnoEiAx4OBNWWcnZL1PK/NzQNzR
         Jrmhp+b/ozHJDluWU/qOG8aYB2ZMMyStXlDz522B1HCxOhFRTLqjdLsnkUznQ3BlrX
         cRv6TWI1dKWo50EVXxo0H+J9cXZEfsI6awmui8Pfnwu2STYVUeAkB/kNPcUvmmP+cK
         gQhjlTlShpDZg==
References: <20210817100555.4437-1-pavel.hofman@ivitera.com>
User-agent: mu4e 1.6.3; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     linux-usb@vger.kernel.org,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>
Subject: Re: [PATCH v2] usb: gadget: f_uac1: fixing inconsistent indenting
Date:   Tue, 17 Aug 2021 15:05:44 +0300
In-reply-to: <20210817100555.4437-1-pavel.hofman@ivitera.com>
Message-ID: <871r6sgtsh.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Pavel Hofman <pavel.hofman@ivitera.com> writes:

> Fixing inconsistent indenting identified by kernel test
> robot.
>
> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>

Acked-By Felipe Balbi <balbi@kernel.org>

-- 
balbi
