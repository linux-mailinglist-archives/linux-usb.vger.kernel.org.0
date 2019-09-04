Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C40D7A969F
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2019 00:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730032AbfIDWln (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Sep 2019 18:41:43 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35157 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbfIDWln (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Sep 2019 18:41:43 -0400
Received: by mail-pg1-f196.google.com with SMTP id n4so246469pgv.2
        for <linux-usb@vger.kernel.org>; Wed, 04 Sep 2019 15:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F7w7OYWEZp92dbWwWfKCD0/GMcWvLQYFBW0H+BsI0yY=;
        b=S9HabiEoGTVsur2kzoliknHRgENKmGHHuORCxFux0MZLNCi4uI64q0L3AbjfI9oXiW
         Ol+n98+2c8TLzKp0JmirprwgYfGCrcw71+13XO81KW5vfmAo4zLwCLJ0Iq9kB5zs4dra
         MDGKCqgFMdOZxhKxxH8KgBs7K8pBLSFSmqva8inGOOfYMooL0Yn/w9p4vLS4/cVqVLdk
         C1OY3tpJZWWHeXm975Z36vbSasINlDUdZ9yFqkIp8OzHx+SzTcZzJ1kx6iLQx6BWYIRG
         IjBHE4ZP9eIRYpOAa/75/9sB7/kIiFGmUkMS6XZ7PWK4pDco+bVol5pYXYKqHHtghJ1S
         Zo/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F7w7OYWEZp92dbWwWfKCD0/GMcWvLQYFBW0H+BsI0yY=;
        b=Igo/n5X/T+KQ0YW151usWaMxgTU6F/rVfkmrZ4mRaYQ/b2ZmZpD8AnBz5DPv9Cgdp0
         +rLcNl0O09G+38aO8iYmZ7MK5vgqcf8ICbV65HpTd1u4btZU3zMA+AXZI8jh6crQqWAv
         pKEgNMlhNNERdSM3V8yFSvO1yayvNl7/5ByHAUCLPIa6tylnquVdEA23Brr211uNyJA3
         lquj1Ya+PNBvLnrMJGgyZHCs2XNUijzF7LfJMJ88XgLPsiNpi3fwuIl5EbGzndvMVBRD
         MzKGeYDuYXJOw4ZrKp+FaG3/kQ2pMglPz73ErtvOQxlG0FN4AbSAK35Eqe6IxaX7SGvu
         WhIA==
X-Gm-Message-State: APjAAAWWSu8I3TqrwTjD5KnPd9d9loEoglN+wbDejv/cbWHlk7eSFh/5
        2tIwhAz2+sPLQUTH1+RpssezgA==
X-Google-Smtp-Source: APXvYqznDsIr2C14kjGSQV8JdcBv9qpoetbNHpdsCPFVRFAR3SY86n+TqDytSXZBKzEHxh8lgZfLrg==
X-Received: by 2002:a17:90a:ac0a:: with SMTP id o10mr519853pjq.139.1567636902930;
        Wed, 04 Sep 2019 15:41:42 -0700 (PDT)
Received: from hermes.lan (204-195-22-127.wavecable.com. [204.195.22.127])
        by smtp.gmail.com with ESMTPSA id t9sm148163pgj.89.2019.09.04.15.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 15:41:42 -0700 (PDT)
Date:   Wed, 4 Sep 2019 15:41:40 -0700
From:   Stephen Hemminger <stephen@networkplumber.org>
To:     Hui Peng <benquike@gmail.com>
Cc:     syzbot+44d53c7255bb1aea22d2@syzkaller.appspotmail.com,
        alexios.zavras@intel.com, andreyknvl@google.com,
        davem@davemloft.net, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        mathias.payer@nebelwelt.net, netdev@vger.kernel.org,
        rfontana@redhat.com, syzkaller-bugs@googlegroups.com,
        tglx@linutronix.de
Subject: Re: WARNING in hso_free_net_device
Message-ID: <20190904154140.45dfb398@hermes.lan>
In-Reply-To: <d6e4d2da-66c6-a8fe-2fea-a3435fa7cb54@gmail.com>
References: <0000000000002a95df0591a4f114@google.com>
        <d6e4d2da-66c6-a8fe-2fea-a3435fa7cb54@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 4 Sep 2019 16:27:50 -0400
Hui Peng <benquike@gmail.com> wrote:

> Hi, all:
>=20
> I looked at the bug a little.
>=20
> The issue is that in the error handling code, hso_free_net_device
> unregisters
>=20
> the net_device (hso_net->net)=C2=A0 by calling unregister_netdev. In the
> error handling code path,
>=20
> hso_net->net has not been registered yet.
>=20
> I think there are two ways to solve the issue:
>=20
> 1. fix it in drivers/net/usb/hso.c to avoiding unregistering the
> net_device when it is still not registered
>=20
> 2. fix it in unregister_netdev. We can add a field in net_device to
> record whether it is registered, and make unregister_netdev return if
> the net_device is not registered yet.
>=20
> What do you guys think ?

#1
