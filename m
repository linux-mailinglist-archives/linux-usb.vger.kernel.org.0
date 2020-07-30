Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA518233520
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jul 2020 17:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728910AbgG3POx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jul 2020 11:14:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727072AbgG3POw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jul 2020 11:14:52 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C338C061574
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2020 08:14:51 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id i26so16900129edv.4
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2020 08:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-transfer-encoding;
        bh=WrCNkCXz6QISjoN40arnI7wl+5pp/mHL9fnudk74zyM=;
        b=j7+AJNAIw5M+LYzWNR9mhduVh73P2duNyfC0YFakoypurKs7fRcZ5Ope+FTcBQUS+f
         cDm8Lreu/8TQcnyUbxZXvtg8N91AUjoRn/pTYyO23f4oJwUfrvq4hZe/YtHykaqG2hWJ
         obH7I/kNTjebwqoLWqIiokeNsNFkNzpBkm4re5JbSSK+0/huIAE3aAijdSqy2dvqg9W+
         zcS3Lpp2Ke/3CnEUmJze+BkwzsXIbNcjZmc/CGUUl9q69yeO/efmfxBwuYs+3rg4MEIO
         S6KottO4Tc80Ve4+pNMTzaegIj2RWbAzAb8evEThvfzGZtpiUXhLl8VfeZHMKaR1sT71
         FyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-transfer-encoding;
        bh=WrCNkCXz6QISjoN40arnI7wl+5pp/mHL9fnudk74zyM=;
        b=o/5xr1WN9OfF/3b40PtLJcVdT8qmJ9qUwoZiwUD8x6sM8HfMcyNo4BiOlDwXzP7Yoi
         r126O2gMU4iHuWnENYx2qAeLwcWJ8X3Rje0VHbBiqtCoptMwSpP7Vj/W2m3d+b7qpxHT
         DrCYzpOv0qEQjqB2xrs89EmoTdE5BwlrjeZ27DMbFbxtuqVykqUOr3Gqkct7sg05TbwB
         wber2zQpCEM329dh2X0XKR+fe8/5E4QQ4at48VzTx74N+AAh++BeucOiKIYdt70kEYAj
         m3cJfvwPe1nToPcH8Bfm++DWUmVDBJo3EpGRL4cnYxzj6Q0gBTlOMWpGqPR2Z1EVC6Xv
         t2mQ==
X-Gm-Message-State: AOAM530khOEb03wbDxblxfrWhLa4R443Yw9my5WpP0HPOPrZNzDrAh6s
        UdLNJP18ZoKycDxe2515BSPAQ0tCb9g=
X-Google-Smtp-Source: ABdhPJzrG8QzELUrEMoizr4expDVl5dXogQ3SdL5YUbkYtWihQ7sLFCDTgxklafCobjd3XSuALOWCg==
X-Received: by 2002:aa7:cf19:: with SMTP id a25mr3080135edy.67.1596122090206;
        Thu, 30 Jul 2020 08:14:50 -0700 (PDT)
Received: from [109.186.98.97] (109-186-98-97.bb.netvision.net.il. [109.186.98.97])
        by smtp.gmail.com with ESMTPSA id d20sm6577666edy.9.2020.07.30.08.14.48
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Jul 2020 08:14:49 -0700 (PDT)
Message-ID: <5F22E3C7.1030305@gmail.com>
Date:   Thu, 30 Jul 2020 18:14:15 +0300
From:   Eli Billauer <eli.billauer@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.12) Gecko/20100907 Fedora/3.0.7-1.fc12 Thunderbird/3.0.7
MIME-Version: 1.0
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        hdegoede@redhat.com, oneukum@suse.de
Subject: Re: [PATCH v4] usb: core: Solve race condition in anchor cleanup
 functions
References: <20200730141836.16550-1-eli.billauer@gmail.com> <20200730144614.GB1604718@rowland.harvard.edu>
In-Reply-To: <20200730144614.GB1604718@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 30/07/20 17:46, Alan Stern wrote:
> This loop ought to have a cpu_relax() somewhere, probably here.  Same
> for the other two functions.  Otherwise this looks okay to me.
>    
This function isn't so well documented. Does it go with an include file? 
asm/processor.h, for example? Or just add the call?

Thanks,
    Eli
