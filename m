Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C2BC206EF
	for <lists+linux-usb@lfdr.de>; Thu, 16 May 2019 14:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbfEPMbT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 May 2019 08:31:19 -0400
Received: from mail-wm1-f44.google.com ([209.85.128.44]:36498 "EHLO
        mail-wm1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbfEPMbT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 May 2019 08:31:19 -0400
Received: by mail-wm1-f44.google.com with SMTP id j187so3297856wmj.1
        for <linux-usb@vger.kernel.org>; Thu, 16 May 2019 05:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=irrf18TkAnIBwB/sk9ySrW1xPmg8nh248pMwpcOj6vw=;
        b=thC3f1iDVZgRUtHibjDrwdsOXWSHr76v4O4wTGuAdeXHJTGtLP9jHX8SSD1Jy3ZgFr
         CHwQCgEqkWMds3L6fBkwCB105+8ouKkF2l686QPfbsGYwnnmPOM80VW4J4VHousWmnfr
         CPD+PDpaBIBedyR98yR/KWhbBeb0gAId5wOEzrMhyKAT/LqtXjdpVOprl7jrcjqiRZfM
         7C/GjSmWmrc42hN+gm4+3UoUv0IPn+oqs5W4lsaeYbMzKeCeZdlZZw/mEja+nBmbWpw8
         +Wt33Ed3HpB3uA3riiQn0WJb5BT6PQKQkJAv9D3byS0LZX18Pc6/zf1T24tXNGqreEGu
         +N5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=irrf18TkAnIBwB/sk9ySrW1xPmg8nh248pMwpcOj6vw=;
        b=Brye55+Y6Z8YZ4Xk9TObebmLYwVrRrVI+gVOhOuCMom7Eqr7c1XXACxxdgSOvtIePn
         x9BHK9ZiiRB7auZ7WI80ufXb9adAOZBcc0mXOw1tgjYQ3Ox0Jm2fQd+MJHOb4AZlzowS
         DRuOyfj4gWdQcnBH5n1Jnx9g48seCJ4QwXH7v9g3yGVJYr3EeIR3mhAShd8CjRQexL6n
         H8NSud8LFPWDxNcFlHozIYktMdpQEacVuMQ987c7FUx4++C/aqDP7T/viZtN1ffnTlCf
         xy0cv0SvwTWr52fv2Gy5YMirEgYYb1oyRu5PI8oebnzasSmPy6NyQE1dGjwtnpD6Dpfm
         GX0Q==
X-Gm-Message-State: APjAAAXtqcZWGwc8M8L/eI0WxK2o6a/dG+0lJ45hYJSLhyWlfJPlEzgg
        UaDT8CNGNoQonxDJFMRPr8Q3mhtw2/o=
X-Google-Smtp-Source: APXvYqzfdrxn81F0I8WiF0aHTKPNawHy9ngG+eXrZmJExhlx1p+O3dRKoolJHbwzcmRqomCK/B8E4Q==
X-Received: by 2002:a1c:2d0e:: with SMTP id t14mr27129291wmt.33.1558009876799;
        Thu, 16 May 2019 05:31:16 -0700 (PDT)
Received: from [192.168.99.70] (mail.unidataz.cz. [193.165.148.130])
        by smtp.googlemail.com with ESMTPSA id p14sm4563625wrt.53.2019.05.16.05.31.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2019 05:31:15 -0700 (PDT)
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
 <4a48a017-fbcb-619f-f2d5-4d627a673021@gmail.com>
 <1557993530.14649.0.camel@suse.com>
 <b4c3eba7-758d-7951-afd0-d90a261346e8@gmail.com>
 <1557995692.14649.2.camel@suse.com>
Message-ID: <e1f84b32-fb1f-8a47-612b-aa556981959f@gmail.com>
Date:   Thu, 16 May 2019 14:29:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557995692.14649.2.camel@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: cs
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dne 16.5.2019 v 10:34 Oliver Neukum napsal(a):
> Mention
>
> 1. kernel version
> 2. whether this is known to be a regression
Sorry for question, can you more specify what you mean?

> 3. include the log with iommu disabled and mention that you disabled
> the IOMMU
> 4. Include the output of lsusb
>
> 	HTH
> 		Oliver
Thank you
starosta
