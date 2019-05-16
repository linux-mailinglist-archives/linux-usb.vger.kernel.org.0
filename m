Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 387A52012D
	for <lists+linux-usb@lfdr.de>; Thu, 16 May 2019 10:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbfEPIVt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 May 2019 04:21:49 -0400
Received: from mail-wr1-f42.google.com ([209.85.221.42]:45605 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbfEPIVs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 May 2019 04:21:48 -0400
Received: by mail-wr1-f42.google.com with SMTP id b18so2252003wrq.12
        for <linux-usb@vger.kernel.org>; Thu, 16 May 2019 01:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=OA6EHZ+rBgX+AI6HnQlVvtFA4GwIJHdDavuc+cgpLGY=;
        b=QRRy5o6JqhpIs0U1mNu7NcuApp351BGFoFqP8bY4PoYZU8Ph6zr7ktVOuVIIzwugw7
         +ifpQnYT7LkhqkJqopDjaJ+Hc0SBYfzmFD0IGKDpEz1+/+FVfiYk/HblSpCZNfaC4yLI
         MU0g9jk5JQVTT83cl5e8CX8eK5oNLGETe0+29S1ltzJXL8sPWs4wkRRHhUkR6+WY4j+i
         z0RSJmLPVHbHuwjZ3UDZDcQp+A6RMRJoOOTqq3qvFNyM8AW/S/s7uyFut5x+6PsCq04x
         6dQzYmLAd7W9EuWjFQL2ZZ66X//KfoPNDtlMrUfS3CtHqPWpSWstn1kPVlKBEh1NoHOZ
         GVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=OA6EHZ+rBgX+AI6HnQlVvtFA4GwIJHdDavuc+cgpLGY=;
        b=mcCthSEwOsE9dRMyYV1oNYd4piaJA7FrMbtfsbO4D97e+zL0EhWdlF0ejGs/A3+rlU
         UAsbCqRITkU+eQlpzkeanCRosaJXKLqqEeS+Yzx8AbNF7UbBMHo9gEO1NK7QJfRfNoUu
         J9+AVZ6Gii+NBMMcwLx2rScoUnJlOn2qV10hW11IN/kRLJWz9XYPwnqmpleF7vuYHl23
         1piJiQgHrHuWtVBnyapSniuizyW7yjFHNq+o9tfWg3sIU2ibhVEg8Nlt+PzpjaTqRZhX
         qFzY0lx7F/pt6NtI9dI1oJwPPJyXby8kM/XbQzEv/xJHqiacuiyMnk0nXCmdtAUv6bJ2
         Cx7A==
X-Gm-Message-State: APjAAAWGntwY61xZlVSp1CQtChwv2WrnWs9Ahi76hCxLmC7R/lAAoWlh
        Vy7gFYdP6T1Gelui6IbM+pS65jeu3qM=
X-Google-Smtp-Source: APXvYqxkeYGoD/laDD7Ea90alg2fzAedjgG/rMQYh7GefFFIyxG/DJDlXfcZlQH6cNW1hgrgzhR07g==
X-Received: by 2002:adf:8068:: with SMTP id 95mr28208094wrk.174.1557994906868;
        Thu, 16 May 2019 01:21:46 -0700 (PDT)
Received: from [192.168.99.70] (mail.unidataz.cz. [193.165.148.130])
        by smtp.googlemail.com with ESMTPSA id h11sm5589112wrr.44.2019.05.16.01.21.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2019 01:21:45 -0700 (PDT)
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
Message-ID: <b4c3eba7-758d-7951-afd0-d90a261346e8@gmail.com>
Date:   Thu, 16 May 2019 10:20:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557993530.14649.0.camel@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: cs
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dne 16.5.2019 v 9:58 Oliver Neukum napsal(a):
>>> 2.Send a new report to the corresponding mailing list
>> Which mailing list is correct?
> In that case linux-usb@vger.kernel.org
>
> 	HTH
> 		Oliver
>
Is there some rules how to send bug report? Or I can send report with 
"my amateur description"?

starosta
