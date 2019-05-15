Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D58F1EEAF
	for <lists+linux-usb@lfdr.de>; Wed, 15 May 2019 13:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731554AbfEOLYU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 May 2019 07:24:20 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43197 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731791AbfEOLYT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 May 2019 07:24:19 -0400
Received: by mail-wr1-f68.google.com with SMTP id r4so2228229wro.10
        for <linux-usb@vger.kernel.org>; Wed, 15 May 2019 04:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=iK7Jdq13nvzwfdloB64qXfEzplthagbP/dPnPLWGrQE=;
        b=X2nfQ9d+ogB+13LzvpWGxU2FtqTrDaFgjbZJzfz+GIN8KSMsrKP/i0HzYodOqb8NM+
         /U0q1gjkWBvxCr6gnV9iFvvm4Qu9iuYNC+CVBLw3jKBLF/ni3DzhMgsEYIAHHkkRIZHQ
         6+kggP58nysZT4vzheXB4aPdeMl6xVIc665ECpbwx+TfK4wBDIWNWQZRUQ6VcqyhlNnD
         v4yNoZyF61wiNs4hReHZE8sd+eAcPI8gn330Yid8BBsudM9oVHcAHwdW+/2bgn7lEvqc
         eLkiuae7O8StNQAF05Xt8N6LUBzH1oNGYy8451YAYOeYRYUBCjk/CNxeZEhW7YW9t0z+
         mZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=iK7Jdq13nvzwfdloB64qXfEzplthagbP/dPnPLWGrQE=;
        b=Vehw70tBgyvWgldQpglbIaZixxNjJTcox4cuM3lNGczaMyVX3WaAHNkPIVbwBJDMgj
         /m47iJ96VzQHX/5xth5fjyhGTTsCGMEKUufw2Dyp1EMN6sCNnSa1Nw36+6n/0B+WrbJX
         OuXX8ZUGV77d3glx4A4sta43Jcm+0L9xYK0yys/K8kbJI5lsJxWR7WtmN+DzwAPfH6mU
         CZMiwrM0F9yJl75a64zo/9Ftp2KDy9iDhZXi2HfCxcYslf7CFdtYzfjbNf+l6g7njcvP
         BijIkMdiGZl/LwXn6xTNG0p/H8iirpEkI4gK4CsHgeeQ06PywEDu3BZdwqQyKdNqLJen
         v5Tw==
X-Gm-Message-State: APjAAAWdwoSbgv0cDmXbmeoH4ZdJU5x1vYG/Mj3PhuSwe/5aU3fPVuJA
        Xkns0XhdENRBclDR+lTjuPUMFl9rqSE=
X-Google-Smtp-Source: APXvYqz20Ph3VMG2q93+rpwvfwoVjuDwSfuDmS3H+IKGL6HGHqdN89ujL1mQtamj+N+3HJJOxB1WWg==
X-Received: by 2002:adf:dc8a:: with SMTP id r10mr25577049wrj.15.1557919457324;
        Wed, 15 May 2019 04:24:17 -0700 (PDT)
Received: from [192.168.99.70] (mail.unidataz.cz. [193.165.148.130])
        by smtp.googlemail.com with ESMTPSA id e8sm3959408wrc.34.2019.05.15.04.24.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 04:24:16 -0700 (PDT)
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
Message-ID: <0903714d-8b72-e714-70ea-67d9dcd94b74@gmail.com>
Date:   Wed, 15 May 2019 13:22:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557913582.2950.15.camel@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: cs
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dne 15.5.2019 v 11:46 Oliver Neukum napsal(a):
> Most helpful. First, try to replicate this with the iommu disabled.
I am trying this with "iommu disabled" in bios, but system crash too: 
https://paste.ee/p/wUgHl

> Secondly, make a proper bugreport mentioning the affected kernel 
> version (5.1)
How can I do this?

> Thirdly, if possible replicate this with the vanilla kernel from 
> kernel.org
I am afraid, that is not possible. My skills is not too good - is there 
some procedure to how do this?
I made test with mainline kernel 5.1.2 from 
https://kernel.ubuntu.com/~kernel-ppa/mainline/
but computer crash on boot (kernel panic: unable to mount root fs...).

starosta
