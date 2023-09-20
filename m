Return-Path: <linux-usb+bounces-406-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 273207A73F0
	for <lists+linux-usb@lfdr.de>; Wed, 20 Sep 2023 09:23:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5CFB281A74
	for <lists+linux-usb@lfdr.de>; Wed, 20 Sep 2023 07:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C2E8829;
	Wed, 20 Sep 2023 07:23:47 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9657E8487
	for <linux-usb@vger.kernel.org>; Wed, 20 Sep 2023 07:23:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A44EC433C8;
	Wed, 20 Sep 2023 07:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695194627;
	bh=Fr3JD9GG9Pv2NhbFBRrIecMlB8b/cJd3MubePCRDoBI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ryGeX7ybQANwCRQBuGONr8oqGV/MlwcqmdsvDiBCp1EA3XCldLTifNAk6E9xuHhd0
	 XLQSc+8R4cV4UYfjlWw5K5qs4+lBxQtP1xXX8HTJV9tA1RwzNK5j1kjvnviV9glm3o
	 2bFlIkiuHTM8nDUIfvwVxSToXqIvEr+3Y+vQ0xBmBnl5CP0UGuXOkGW2LbUX1NDsJ/
	 4gpYh4aPITARMMwak1NiZd74A80fNTOoP/ZP1npKmqtzuaSrb98v8KQHb0f224WWj9
	 LF2cwkbtb0kOGYFJrGw3HcqKGc8Px2TAy10aAy2S8OAWT90QRgUOw8zW8DWYkbKkSz
	 x3eqE3NsxQ8TA==
Message-ID: <f25b7cd6-90e9-1d81-d135-38bb3df408c5@kernel.org>
Date: Wed, 20 Sep 2023 10:23:43 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] usb: cdns3: Modify the return value of cdns_set_active ()
 to void when CONFIG_PM_SLEEP is disabled
Content-Language: en-US
To: Xiaolei Wang <xiaolei.wang@windriver.com>, peter.chen@kernel.org,
 pawell@cadence.com, gregkh@linuxfoundation.org, pavel@denx.de
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230912064946.1405848-1-xiaolei.wang@windriver.com>
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20230912064946.1405848-1-xiaolei.wang@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/09/2023 09:49, Xiaolei Wang wrote:
> The return type of cdns_set_active () is inconsistent
> depending on whether CONFIG_PM_SLEEP is enabled, so the
> return value is modified to void type.
> 
> Reported-by: Pavel Machek <pavel@denx.de>
> Closes: https://lore.kernel.org/all/ZP7lIKUzD68XA91j@duo.ucw.cz/
> Fixes: 2319b9c87fe2 ("usb: cdns3: Put the cdns set active part outside the spin lock")
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---

Reviewed-by: Roger Quadros <rogerq@kernel.org>

