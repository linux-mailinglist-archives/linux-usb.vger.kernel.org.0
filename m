Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9DD20855
	for <lists+linux-usb@lfdr.de>; Thu, 16 May 2019 15:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727307AbfEPNiC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 May 2019 09:38:02 -0400
Received: from mail-wr1-f49.google.com ([209.85.221.49]:44985 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbfEPNiC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 May 2019 09:38:02 -0400
Received: by mail-wr1-f49.google.com with SMTP id c5so3412859wrs.11
        for <linux-usb@vger.kernel.org>; Thu, 16 May 2019 06:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=FFOI0ZUH55p4MBcmLBSoDHFwh9O1y33Z+QL/gL7CF3c=;
        b=XaJcgZaW01x4qPENcCQ5Ataca3oPJcsV2k7H3l78PmA0NSo12IMGu59dqrkaKgJUeH
         avOPXSyW2jhm+csZw3URRAewdIzhy+vZ7WhoN3UdPamENdBl/NhQgWIVuWlTpKx/TvP1
         1P1YPB5Z1PROJccaKGl1Fq+cq/tNWsIf4hi9Z2GMfZC3zNrWwLzSmyk+0WEdeHYw4DSR
         LkoWLdkbD7aQo7zSA9FKBRDXRfwhx2CzMORe4funzdz3aLDOFVNu9pj7XUK11c8btMMM
         wQ8tHDaSBL0KgdMCTv95rAcuxupJfJjSQdsQE9HdLQJA8JdWJDB3oOwA8siagW1vz5Yl
         6sDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=FFOI0ZUH55p4MBcmLBSoDHFwh9O1y33Z+QL/gL7CF3c=;
        b=BbXZ5EB8kdgIPXcoWezMZScq9eUA6S5jOok85P/cw9ZYfHd5j/qbZ9LqQpHOIp+2vZ
         5y9pbOfYu1p6N/16cBaT/av/GNre4pvVV/3QbmiekRXFc80n+mJzyOSmrVruwI0XeCab
         g0xBL5kAQS8pATc2lB46QJqDlgeXMEXUj370emu+EgiCKoSnLSjlA6TzVH0BxWHX0qpN
         ArLXVyY+eweK6lmvfn8gUXK32rfkoJ8/HWw4ngNVloXLaQ/NNMtK1g7U5JKlIRvVt9rU
         j2ATSzoAjiT+xmn0dR5gxd63WlFt+0RVqIe2U8BORRxsDLTpLw2znQwY+7cUe/GLMqvJ
         VAmA==
X-Gm-Message-State: APjAAAXwJ1Q+yP8Dog+Db090BpSjgWQdDC/J8MJxrLEBnSDXXNmUqeMl
        gDoYNT/QW7SjPVR4eBeGhLVMUl8+uNk=
X-Google-Smtp-Source: APXvYqxqZqZJ01a2hG8nkQknkQ4PGjfUG72VKBMhziC4ERZ+KmBO28jCNTi4hGchKOHZc2JoOmWMtA==
X-Received: by 2002:adf:dc0c:: with SMTP id t12mr17184746wri.101.1558013880448;
        Thu, 16 May 2019 06:38:00 -0700 (PDT)
Received: from [192.168.99.70] (mail.unidataz.cz. [193.165.148.130])
        by smtp.googlemail.com with ESMTPSA id t6sm5512804wmt.8.2019.05.16.06.37.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2019 06:37:59 -0700 (PDT)
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
 <e1f84b32-fb1f-8a47-612b-aa556981959f@gmail.com>
 <1558012314.3309.2.camel@suse.com>
Message-ID: <9db5488c-c5f6-58a5-6edf-cdac4108f284@gmail.com>
Date:   Thu, 16 May 2019 15:36:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1558012314.3309.2.camel@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: cs
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dne 16.5.2019 v 15:11 Oliver Neukum napsal(a):
>
> You will be asked whether this worked in earlier version of the
> kernel. The answer would be: yes, no, unknown (why)
>
> 	HTH
> 		Oliver
>
Thank you, I sent new report.
starosta
