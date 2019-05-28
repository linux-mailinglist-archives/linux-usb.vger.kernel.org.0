Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2194D2BFB7
	for <lists+linux-usb@lfdr.de>; Tue, 28 May 2019 08:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727598AbfE1Gw3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 May 2019 02:52:29 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]:35558 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfE1Gw3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 May 2019 02:52:29 -0400
Received: by mail-wr1-f50.google.com with SMTP id m3so18877577wrv.2
        for <linux-usb@vger.kernel.org>; Mon, 27 May 2019 23:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Vd8EjTCcnvb0zXk7HEZoSEtgYGmQOW7M7FDmqYYozqI=;
        b=reKngeGqpdxiqF2+GGOrrpvyOmsYujXihMIBWdKwoms5vCsTshp91BGatkraVltsR0
         8WweowzEaYTCSoBOn5oB8TlmmPmdFS9RgRV6p1I1UX7frzGhsFZZZ2TA2q1QOEN51La8
         h8tKqPuuDsqTYv9azJdFWdXkVovJrebh/ecwx7H8A9UeZDwj0NQLBRkh0kvMQqEl07b+
         vFcvA4+8512opmBhePm+ZOnO4HXdL+GKoNK9SRuCGEMSlFY3IpGs/8VQifB3ud/grnfF
         ELwZVRinbyErE9mJJXhJYdx4y5lXb02/pkjQiU21E5kIk0e9dXnJHLs+p6TjFKpyzPDx
         Pchw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Vd8EjTCcnvb0zXk7HEZoSEtgYGmQOW7M7FDmqYYozqI=;
        b=suPVXYNR5o4L/bxcFjVMNEkeqKndZ3Tmii4YNKxYfsjUxg01j5521fUhr7E3rMkd+E
         dNi8rAOBEaktcYnquyGhYpk2k1Mgtg165eSRg+sztWDhKSpaBnUwHXHbINln/j2o1cJ9
         /Ujk5HPtU+WNC+NIVKdIYLJA9ggS+Pe/j0NiMJAs7GQQeY72z8BI/555s5/8ieIMDWKS
         9DDTsz8JqzAbrO13VfD730OOFqRqyXRlttSC2v7PUpLLrOWR+jfqTLTKjwsbIrfjZKAC
         6Wbvo2FqJ41HYCeA/E+ouAkzZhGRuKC4NyAwcrUfKyiWFrDNypATKuVk6N/1eQfwiNM+
         745A==
X-Gm-Message-State: APjAAAUXtz88AduwDGMIVfvKiHAC8+SumJMlgfbaHmqiJUg28BiwZMEL
        rrw1gPgQNm8wmbGGUtYYp4M=
X-Google-Smtp-Source: APXvYqwU4aa1VsHXoUoR2lDrfUuseF0Vny/+8++jJRYtVetuyNigG8IouBF4C3yFA+JS+dKCT5bYJQ==
X-Received: by 2002:a5d:6506:: with SMTP id x6mr1079532wru.339.1559026348125;
        Mon, 27 May 2019 23:52:28 -0700 (PDT)
Received: from [192.168.99.70] (mail.unidataz.cz. [193.165.148.130])
        by smtp.googlemail.com with ESMTPSA id d26sm1318232wmb.4.2019.05.27.23.52.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 23:52:27 -0700 (PDT)
From:   "StarostaCZ@gmail.com" <starostacz@gmail.com>
X-Google-Original-From: "StarostaCZ@gmail.com" <StarostaCZ@gmail.com>
Subject: Re: Kernel crash with FTDI FT232R on AMD boards.
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
References: <11678333-2e1a-8c0f-109f-a1aefa54ef9a@gmail.com>
 <20190516135612.GA28564@localhost>
 <0d499fe2-80df-cd6d-17a2-7725df240ee8@linux.intel.com>
 <6fe1e8ef-f8a5-7766-d0c5-1c6471e20855@gmail.com>
Message-ID: <99ce26b3-b206-033f-7852-60d097d13695@gmail.com>
Date:   Tue, 28 May 2019 08:52:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6fe1e8ef-f8a5-7766-d0c5-1c6471e20855@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: cs
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,
I sent 2 times new email with another logs, but this email is not in 
linux-usb mailing list. Why?

starosta


