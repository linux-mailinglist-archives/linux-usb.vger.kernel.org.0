Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6D833AE92
	for <lists+linux-usb@lfdr.de>; Mon, 15 Mar 2021 10:23:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbhCOJXM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Mar 2021 05:23:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:48898 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229553AbhCOJXI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Mar 2021 05:23:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76F1764E12;
        Mon, 15 Mar 2021 09:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615800187;
        bh=bUL5cVT+cHUm2Y+NIyWO3zYJIcv1PpTmq+IUYNKeq9E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eZTV4HhIHsKa/BL6DqWmQlVak6/SFOMpVVAy7VAoBxmpygV4H0bZV7JucgMtIugct
         BTfihc2nyuIDSH5IEDtq1oSZ11h3hIhigP6GWywxsawVYj9jGS/b0hDLzKY17DD/AO
         NkQC0gEScGT/35Jr6k83DHuTDs1zAfx/D5MMIgsleNGjJmT1Eq+IsvWsUhyxnfvl3A
         vaLpf12eGoj6jZcAj0aDGKop/JPPqeuKTZDW70JWwTjfj7rIG5ScDglv+syifCn8OD
         egZukzB7cisANs0bFmEMgeiP383JZaQn0NNghYD27eg3mF9uTwMFp3N4Ap/rScWtrB
         jzXf+mZfHdEkQ==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lLjRY-00018c-Ff; Mon, 15 Mar 2021 10:23:21 +0100
Date:   Mon, 15 Mar 2021 10:23:20 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Klemen =?utf-8?B?S2/FoWly?= <klemen.kosir@kream.io>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: cp210x: Improve wording in some comments
Message-ID: <YE8niPXaics5r2Iv@hovoldconsulting.com>
References: <20210311131435.293910-1-klemen.kosir@kream.io>
 <YEpHiP3ASiojtBRR@hovoldconsulting.com>
 <YEwgGwOP2NEd8zG8@kream.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YEwgGwOP2NEd8zG8@kream.io>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Mar 13, 2021 at 11:14:51AM +0900, Klemen Košir wrote:
> On Thu, Mar 11, 2021 at 05:38:32PM +0100, Johan Hovold wrote:
> > On Thu, Mar 11, 2021 at 10:14:35PM +0900, Klemen Košir wrote:
> > > This patch fixes some spelling mistakes and improves wording in some
> > > comments. It also renames one variable to unify naming with others.
> >
> > It sounds like you're trying to do too many things at once, and I'm not
> > sure this kind of changes are worth it unless also doing some "real"
> > changes to the code in question.

> > If you want you can submit a v2 which fixes the two obvious
> > spelling/grammar mistakes and the Hz capitalisation that you found.
> >
> > But I strongly recommend you stop submitting patches like this. We have
> > a ton of real issues that needs tending too if you're looking for
> > something to work on.
> 
> Thank you for the feedback. I wasn't aware of the meaning of "iff".
> I thought this patch might have some value. I will put in more effort
> in the future.
> 
> Apologies for the inconvenience.

No worries. It's just that some types of clean up patches tend to mostly
add noise and make things like git blame harder to use. The general rule
is to not send pure cleanup patches for things outside of
drivers/staging/ unless also doing other changes to the code in
question.

Fixing spelling mistakes and grammar may be worth it in itself if it
fixes ambiguity or improves readability generally. And then it's good to
do as you did here and fix it all in one go (e.g. per driver). But
otherwise comments (or style generally) don't have to be perfect.

Johan
