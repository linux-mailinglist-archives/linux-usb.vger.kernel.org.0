Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC4CE174E95
	for <lists+linux-usb@lfdr.de>; Sun,  1 Mar 2020 17:49:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbgCAQtA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 1 Mar 2020 11:49:00 -0500
Received: from mon1.sibername.com ([162.144.64.251]:33407 "EHLO
        montreal.sibername.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbgCAQtA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 1 Mar 2020 11:49:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lockie.ca;
         s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
        References:In-Reply-To:Message-ID:Date:To:From:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=WDWBCmT57UXmJbA83+xBe8JGN5vj1qYCKTobtfo10Ok=; b=JUCyNMZy4op+hB/me7/1m3rH/f
        90TNfvKjoiWXFhlsoglPVXQu3cGsufKTRaUiA1L1rR9+uTP6vErhqz25FjQLsQMWc++TlFyqM54AH
        VW2sRZVC5ezPTWeBFSvnLV/Ju889QZ9ULFYYcyLulilq4rCoNo+zxZOlsr0dFGkyCAUg8CGWLvqYn
        o/8HT/OJ21ams84x63xOR8LmRfSh93rfol0OY7wF2w/L+himKJUJPNTulnx2MpyamtI/fzYLXaRnn
        U+BIgZ8uwh6cS6nk+Ms27Ki3BsJ9kYDbt/G1AFrwOjFDfMhpjS2I7XHpE28OY3lUSBlJcTL/T6RVa
        k6sIQwEQ==;
Received: from 216-58-17-101.cpe.distributel.net ([216.58.17.101]:41397 helo=[192.168.1.12])
        by montreal.sibername.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <bjlockie@lockie.ca>)
        id 1j8Rls-00G0bq-40
        for linux-usb@vger.kernel.org; Sun, 01 Mar 2020 11:48:54 -0500
From:   James Lockie <bjlockie@lockie.ca>
To:     <linux-usb@vger.kernel.org>
Date:   Sun, 01 Mar 2020 11:48:50 -0500
Message-ID: <17097001550.279c.665a3322dda79c663fe860d9fff7dd5d@lockie.ca>
In-Reply-To: <Pine.LNX.4.44L0.2003011021530.692-100000@netrider.rowland.org>
References: <Pine.LNX.4.44L0.2003011021530.692-100000@netrider.rowland.org>
User-Agent: AquaMail/1.23.0-1556 (build: 102300002)
Subject: Re: USB2 device?
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - montreal.sibername.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lockie.ca
X-Get-Message-Sender-Via: montreal.sibername.com: authenticated_id: bjlockie@lockie.ca
X-Authenticated-Sender: montreal.sibername.com: bjlockie@lockie.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Interestingly, the driver for the new device I'm getting appears to have a 
switch to turn the hardware into USB3 mode.
I didn't know that was possible.
What I read by Googling might not even do what I think.
I'll try it Tue when I get the new USB wifi adapter.


