Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 965161F656
	for <lists+linux-usb@lfdr.de>; Wed, 15 May 2019 16:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728215AbfEOOQl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 May 2019 10:16:41 -0400
Received: from mail-wm1-f44.google.com ([209.85.128.44]:32820 "EHLO
        mail-wm1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727821AbfEOOQk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 May 2019 10:16:40 -0400
Received: by mail-wm1-f44.google.com with SMTP id c66so4818628wme.0
        for <linux-usb@vger.kernel.org>; Wed, 15 May 2019 07:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=YCjCBo6v6g6WrU5/XkOQpdgYbmJIm6MrTmOgU9Ei21U=;
        b=UsXKrMtUMNcLrIeZ0277LKCagFDPkzvmZZJAF5aJVQjzqIAG6q5e1x7A2aCPtKCRcO
         Ta7bQ59MIcTlOUZiZZNwNFM4WJBMOrubZGHoBrVYfO18gYI8JbnUfrWo5B8GVMv8sKzz
         8azdKZ6yBk8Oyc5juoqrR97PRHBS2Lpgdlq8qgdvQ1pNHj+04NKFQ3MlpJLDfZ0gXOcI
         Vx+QA8p1gHfluz44k6lHxmZ0p2mIMAsrkWvw6lJCCVYtWE6/a15r6ZPSJRreXR2n43eP
         HE9W+bMVg6Kyk3qY3lG7jmafSsIbG4AabWQnslxZ/pBqJA/MCgXTbG0wOXja5LXoEjPf
         K5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=YCjCBo6v6g6WrU5/XkOQpdgYbmJIm6MrTmOgU9Ei21U=;
        b=beaeolPiv2z7RL+UWM4UgtzEsEtqdeQslXRPL7XzmSkKrLTNB/sn7Q9BsL3PdIqGr+
         GfFNBRUlCbmgCzlXk/iZzm/eANkc3pEDoncpOlDhVHR/+LtLn/9vFXAoYZTU1EWt/wUt
         FCyyoEtCmpXyQR/cNjMLzk+GlkUqVSf7juu7sPIiUmGeAMU7WpBT+adLXiYbastUmvhD
         lkLmVj7TxMbhtt3PKgNbL2KhyK+7GmVzl2muYcZmxmdNTOpQScepLeJ7d5HWWc/o/ZnT
         G8Chbqk30SJWdUFsNFCRJy444G2YMbSW7ljKjLSrotxKpyQhrN8eSstQmBCSWjeBrvvM
         v3nQ==
X-Gm-Message-State: APjAAAVxnyfyWeUNDyf6oX2sv/b9cZzjuRTTVOsnB6i9+T+z00NJW7JA
        HtJmCpW2GqX+1gqF3TDeqTzPDrpd6Ec=
X-Google-Smtp-Source: APXvYqx664FRwC7DA3gsl87Hho1roeqvxvdUgq3sHf5EOeDzje9dsy1M4t65L4Q//GQTNhM9D7XayA==
X-Received: by 2002:a05:600c:1050:: with SMTP id 16mr23229515wmx.149.1557929798431;
        Wed, 15 May 2019 07:16:38 -0700 (PDT)
Received: from [192.168.99.70] (mail.unidataz.cz. [193.165.148.130])
        by smtp.googlemail.com with ESMTPSA id q16sm2480233wmj.17.2019.05.15.07.16.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 07:16:37 -0700 (PDT)
From:   "StarostaCZ@gmail.com" <starostacz@gmail.com>
X-Google-Original-From: "StarostaCZ@gmail.com" <StarostaCZ@gmail.com>
Subject: Re: Linux crash when using FTDI FT232R USB to serial converter on AMD
 boards.
To:     Oliver Neukum <oneukum@suse.com>, Joerg Roedel <joro@8bytes.org>,
        Johan Hovold <johan@kernel.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        iommu@lists.linux-foundation.org, linux-usb@vger.kernel.org
References: <04503197-a0a9-8b35-6c65-c10f296aab57@gmail.com>
 <20190429094847.GI26546@localhost> <20190503153716.GE11605@8bytes.org>
 <8748125e-f360-ff0e-ea15-699bce9e7747@gmail.com>
 <4e7f0267-eba8-81c3-4036-25924ea9df98@gmail.com>
 <1557911856.2950.10.camel@suse.com>
 <3e7ec2f2-ac47-a031-96ba-fa2b9f21ed2e@gmail.com>
 <1557913582.2950.15.camel@suse.com>
 <c57ccafd-7ad4-63e4-54c1-e1fb136ebeed@gmail.com>
 <1557928483.2950.18.camel@suse.com>
Message-ID: <4a48a017-fbcb-619f-f2d5-4d627a673021@gmail.com>
Date:   Wed, 15 May 2019 16:15:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557928483.2950.18.camel@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: cs
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dne 15.5.2019 v 15:54 Oliver Neukum napsal(a):
> 1. Determine whether the bug depends on the use of an IOMMU
No, bug not depends on the use of an IOMMU. System crash on both cases.

> 2.Send a new report to the corresponding mailing list
Which mailing list is correct?

starosta
