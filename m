Return-Path: <linux-usb+bounces-85-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2B97A0DD7
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 21:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AF472819C7
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 19:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40644266A7;
	Thu, 14 Sep 2023 19:09:43 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED82AD307
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 19:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8740C433C8;
	Thu, 14 Sep 2023 19:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1694718581;
	bh=ZXhlR282k21FtlFffFcSOZAyyO7r6KgiTBBr5eW6JWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fbrtVLanZX4aOxFLDP9i9sRu/clKXELS+7GemkPgxAV+1wLAKDTgcW3vq1Tw35TzX
	 +Nd35HtvhG9Y8nEHQGpYpOXT0rB3/HmSVWP+bc4kzlQ82U4E1OIHtB9hBGfCz+VeDU
	 UypVfs5kRl7JO6GhibdweQwVDGQ1WFmUZR899BVM=
Date: Thu, 14 Sep 2023 21:09:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Carl Spitzer <lynuxrocks@gmail.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: This list is being migrated to the new infrastructure
Message-ID: <2023091422-supremacy-devotedly-8560@gregkh>
References: <20230913-early-gloomily-4066a8@meerkat>
 <CAMwyc-T=33CmqabnWdG1PO-OZpDeQr9i7yfT5uhJWYiiyu+jww@mail.gmail.com>
 <2023091442-material-afternoon-50d6@gregkh>
 <CAHeBFz1+4J+DnR4KW-1uUaCwDpqYOukE7PwpDdkNMbH8t6Zzgw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHeBFz1+4J+DnR4KW-1uUaCwDpqYOukE7PwpDdkNMbH8t6Zzgw@mail.gmail.com>

On Thu, Sep 14, 2023 at 05:56:34AM -0700, Carl Spitzer wrote:
> somehow this list thinks I am sending html which I do not remember turning
> on with gmail.
> lets see if remove formatting is the fix.

You sent html email here, please fix your email client.

