Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9A4512511D
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2019 19:58:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbfLRS6F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Dec 2019 13:58:05 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:21376 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726939AbfLRS56 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Dec 2019 13:57:58 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576695478; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=zTaMZ3kQXu+Ya8E5RyL/aG69wJByyfY1IdXqZNDCwxM=;
 b=mTX8BnRq67TAxiJySoJ2sZXaxVfP77Gn7JGq6X8146oA4X0mLl6BHKT/wecDrJ/Bl/Mui923
 zUCazVNwu6flaFoMnebLnUL9CDZ/f8ryWfKf54F4gESeHRNemNP+kiA0514K529unMinsEEC
 d7lM5SjoA1pR1Oo2/01VfGBpPvs=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5dfa76b3.7faa08d38228-smtp-out-n02;
 Wed, 18 Dec 2019 18:57:55 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0D780C4479F; Wed, 18 Dec 2019 18:57:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=2.0 tests=ALL_TRUSTED,MISSING_DATE,
        MISSING_MID,SPF_NONE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6DAFFC433CB;
        Wed, 18 Dec 2019 18:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6DAFFC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kvalo@codeaurora.org
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/5] rsi: fix use-after-free on failed probe and unbind
From:   Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191128172204.26600-2-johan@kernel.org>
References: <20191128172204.26600-2-johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Amitkumar Karwar <amitkarwar@gmail.com>,
        Siva Rebbagondla <siva8118@gmail.com>,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>,
        syzbot+b563b7f8dbe8223a51e8@syzkaller.appspotmail.com,
        stable <stable@vger.kernel.org>,
        Siva Rebbagondla <siva.rebbagondla@redpinesignals.com>,
        Prameela Rani Garnepudi <prameela.j04cs@gmail.com>,
        Amitkumar Karwar <amit.karwar@redpinesignals.com>,
        Fariya Fatima <fariyaf@gmail.com>
User-Agent: pwcli/0.0.0-git (https://github.com/kvalo/pwcli/) Python/2.7.12
Message-Id: <20191218185755.0D780C4479F@smtp.codeaurora.org>
Date:   Wed, 18 Dec 2019 18:57:55 +0000 (UTC)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Johan Hovold <johan@kernel.org> wrote:

> Make sure to stop both URBs before returning after failed probe as well
> as on disconnect to avoid use-after-free in the completion handler.
> 
> Reported-by: syzbot+b563b7f8dbe8223a51e8@syzkaller.appspotmail.com
> Fixes: a4302bff28e2 ("rsi: add bluetooth rx endpoint")
> Fixes: dad0d04fa7ba ("rsi: Add RS9113 wireless driver")
> Cc: stable <stable@vger.kernel.org>     # 3.15
> Cc: Siva Rebbagondla <siva.rebbagondla@redpinesignals.com>
> Cc: Prameela Rani Garnepudi <prameela.j04cs@gmail.com>
> Cc: Amitkumar Karwar <amit.karwar@redpinesignals.com>
> Cc: Fariya Fatima <fariyaf@gmail.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

5 patches applied to wireless-drivers-next.git, thanks.

e93cd35101b6 rsi: fix use-after-free on failed probe and unbind
92aafe77123a rsi: fix use-after-free on probe errors
477682974811 rsi: fix memory leak on failed URB submission
b9b9f9fea218 rsi: fix non-atomic allocation in completion handler
960da557f435 rsi: add missing endpoint sanity checks

-- 
https://patchwork.kernel.org/patch/11266455/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
