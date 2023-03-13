Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1D736B7B82
	for <lists+linux-usb@lfdr.de>; Mon, 13 Mar 2023 16:08:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbjCMPIL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Mar 2023 11:08:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230045AbjCMPII (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Mar 2023 11:08:08 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BCC56C8BD
        for <linux-usb@vger.kernel.org>; Mon, 13 Mar 2023 08:07:52 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id h14so11649828wru.4
        for <linux-usb@vger.kernel.org>; Mon, 13 Mar 2023 08:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kjkoster-org.20210112.gappssmtp.com; s=20210112; t=1678720070;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xqkhHpM0KwjGTqtNt1/rU7IXIVxn9+hwM9muuFZS5g=;
        b=gzR7Xd3d/xv+mcM0TiWjAAZhJK6N8rgx+huTF36Hr9CtMJiyYEGw+0TqRWVfh1Bo2o
         YoGT1iOgtQH0WXRE014OoBngClOokSQw7V2oMpoF07Hp8NcHEShi9Xy48dXZv5mpnbtl
         MCYc6fqmqULXC/7W95ZCBYHctCK+HDuhyDKXGilhfxLGeCyQ9CWaBVq7APXpRdIncYsb
         vRwf03GYtLJ2oUKEzGRx5+rJyydiF4PwPf5Jn6YQP9TpDjoUGmL4uQTAfXXeXBSocppU
         Ku6MBXJ9zEnne1+eAqY4a28fmLYW5m+m1HNM1oZui77Ug41B/DKuQxjCb+s2iYeXs4f5
         QGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678720070;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6xqkhHpM0KwjGTqtNt1/rU7IXIVxn9+hwM9muuFZS5g=;
        b=lwh3dvvMp/w+P+aaS/4SkCMndUnWlbgiluJi5SbI6p8cYmnkF49XOyq9NPizqVnjcm
         d0OSd+10ATHyR6SXFrLY0B3PvFJ8sUHMHcAuMb2zowLFS6s4Q7PU54ymd+l/SSANAMjU
         fT6Oh0rjwkoldHSPw17sC1R6FU4wdjeigX26GUra7LqYnWBb+6hBWrdejbpGoj3Gdeba
         nJNtMbcW0UduMoA+GDBmwjOG3F7qo/ewt4qYOI5gKzXYiW6IC4obW+I2Tgwc/M/kxwuw
         nc2j5g9TfQEvT6HEvcbwSoTCDc5IuOHuY1AvvyNwb7iW1skpWsjhhGNhS4xvknNjSnK/
         bczg==
X-Gm-Message-State: AO0yUKVByT7En9Yd4xmtbGLaevKFKCF2iYtjMpGC3HHPfu64LYI0EBpO
        6RHV/Q1YQGsWOJKM4JpmG4A3B/kQf/DCK2DxrSg=
X-Google-Smtp-Source: AK7set+b56sQCsMzgx5r6k48f8MAv72ch5fQN/2t6GNbAZeoxJMQgFN9dSWB0BSK2w33VUA0VsiOUw==
X-Received: by 2002:a5d:4d92:0:b0:2ce:9c6b:4fd6 with SMTP id b18-20020a5d4d92000000b002ce9c6b4fd6mr5613870wru.70.1678720070659;
        Mon, 13 Mar 2023 08:07:50 -0700 (PDT)
Received: from smtpclient.apple (2a02-a470-ff9b-1-80b9-d992-a308-5ca2.fixed6.kpn.net. [2a02:a470:ff9b:1:80b9:d992:a308:5ca2])
        by smtp.gmail.com with ESMTPSA id c14-20020adffb0e000000b002c8ed82c56csm8281997wrr.116.2023.03.13.08.07.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Mar 2023 08:07:50 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [PATCH] USB: serial: cp210x: add Silicon Labs IFS-USB-DATACABLE
 IDs
From:   Kees Jan Koster <kjkoster@kjkoster.org>
In-Reply-To: <ZA87jMR8qx6YfBVQ@hovoldconsulting.com>
Date:   Mon, 13 Mar 2023 16:07:39 +0100
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <CC93BACA-B0D3-4D52-91AD-926AF894D3B6@kjkoster.org>
References: <20230218141830.5612-1-kjkoster@kjkoster.org>
 <ZA87jMR8qx6YfBVQ@hovoldconsulting.com>
To:     Johan Hovold <johan@kernel.org>
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dear Johan,

Small celebration in my office. This was my first, official Linux Kernel =
patch.

Thank you for doing the work. :)

--
Kees Jan

kjkoster@kjkoster.org
+31651838192

The secret of success lies in the stability of the goal.
    -- Benjamin Disraeli

> On 13 Mar 2023, at 16:04, Johan Hovold <johan@kernel.org> wrote:
>=20
> On Sat, Feb 18, 2023 at 03:18:30PM +0100, Kees Jan Koster wrote:
>> The Silicon Labs IFS-USB-DATACABLE is used in conjunction with for =
example
>> the Quint UPSes. It is used to enable Modbus communication with the =
UPS to
>> query configuration, power and battery status.
>>=20
>> Signed-off-by: Kees Jan Koster <kjkoster@kjkoster.org>
>=20
> Now applied, thanks.
>=20
> Johan

