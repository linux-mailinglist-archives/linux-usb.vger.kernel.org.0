Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 037715740FD
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jul 2022 03:40:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbiGNBkS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jul 2022 21:40:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbiGNBkR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jul 2022 21:40:17 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50EF92250C
        for <linux-usb@vger.kernel.org>; Wed, 13 Jul 2022 18:40:16 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id bu1so541400wrb.9
        for <linux-usb@vger.kernel.org>; Wed, 13 Jul 2022 18:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:content-transfer-encoding
         :user-agent:mime-version;
        bh=QYZQ8MzNXwllqn8JL6iUAom3nGopwIkyJYmVWgvipzM=;
        b=GNMFTne4sh2r6jvCioC6nCXXTMgzW6MalIFNTpAWc9DsU6BvFnmt9LsaoOhqjMnqiZ
         aNEBWZSBWnwcfx1qoe5Q9pW05iGLqXabTGxKNCudNZZAN58RG+K0xm8Ntwdb+YQtjZfj
         9VcSwblwAis6Lnaioo8fFsALlWXeSD1rnVTDS5KqXzOozbEBzTuGPMa60TrGBpQbNXBE
         tZSk9PqPm7LM+4hp8DyYmGQMbbdN5qHbHlNKm19AvA/UfuBDjnwLppQWJwin0shssuOJ
         R+GWj8fm2sleg0BVqhqZgeKUIt0TN6YKP6kxO4NdRdAWbuF79Yy/bIU69nmfh+LSSsdX
         79cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date
         :content-transfer-encoding:user-agent:mime-version;
        bh=QYZQ8MzNXwllqn8JL6iUAom3nGopwIkyJYmVWgvipzM=;
        b=N/zR9pJkpY5ef0vpoAI66C8lHTnBONptv3HZaNs2UTiYGhA4l/V6fDh9vkCF0SIu7r
         s0MCLwPpXpU7WwuQZ+UbVkZ0bCfgIm5x/SalNwh+tjB5mJcyjQIR8YKqyvCzrmQyKyKd
         oqDIwHfJwxD0vnYKQDt9bMVdNGp35gCLFrk+59W/l6V5m5BX8VGKYhVPSdLOtfraV70M
         YA0XSGioAafIqhJW6WfjkCFJkmsAOwQfUpGhpy4NMTpDay6haZTKrtpA44/XbsOCLzG2
         F8kn3+hlyWkfWrQ/ggWSU7tTcVGrPNb9MTYdqYU5wejF0Fxig5LZk0TfdHLH0gFkUpeB
         QT9w==
X-Gm-Message-State: AJIora8farhSHzD7dZostskG4tQmF15/nhDq648AKmYdS5bH0jAicNUc
        7fLQ6h4j8shXcgN5eUBvq5fJaKc08HROtg==
X-Google-Smtp-Source: AGRyM1s8zc2LGLC55FhJQJyMBEuSdesbfoFewZmvQ9WATQoZP4hcwoXzf4X1LgzVq/ifUTmSh1n98w==
X-Received: by 2002:adf:f746:0:b0:21d:6afd:b7d3 with SMTP id z6-20020adff746000000b0021d6afdb7d3mr5683673wrp.501.1657762814723;
        Wed, 13 Jul 2022 18:40:14 -0700 (PDT)
Received: from ?IPv6:2a01:4b00:9414:100:70ae:aa59:3138:f63c? ([2a01:4b00:9414:100:70ae:aa59:3138:f63c])
        by smtp.gmail.com with ESMTPSA id z5-20020a5d6405000000b0021b966abc19sm119277wru.19.2022.07.13.18.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 18:40:13 -0700 (PDT)
Message-ID: <65e251bdf20b7cc2f48a1be4bfd69456709d01c2.camel@gmail.com>
Subject: [questions] about usb_set_intfdata(intf, NULL) and if race is
 possible between ->disconnect() and ->suspend()
From:   Alexey Klimov <klimov.linux@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        klimov.linux@gmail.com
Date:   Thu, 14 Jul 2022 02:40:03 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3-1 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For instance, let's say we have simple usb driver with:

static struct usb_driver usb_some_driver =3D {
	.name		=3D DRIVER_NAME,
	.probe		=3D yet_another_probe,
	.disconnect	=3D yet_another_disconnect,
	.suspend	=3D yet_another_suspend,
	.resume		=3D yet_another_resume,
	.reset_resume	=3D yet_another_resume,
	.id_table	=3D yet_another_device_table,
};

1. Can ->suspend and ->disconnect methods race?

Documentation/driver-api/usb/power-management.rst says:
This implies that external suspend/resume events are mutually exclusive
with calls to ``probe``, ``disconnect``, ``pre_reset``, and
``post_reset``;


Comment for usb_suspend_both() says that:
 * ...	Usbcore will insure that
 * method calls do not arrive during bind, unbind, or reset operations.
and that:
 * However drivers must be prepared to handle suspend calls arriving at
 * unpredictable times.

Also I was asked couple of years back what I am going to do if
disconnect() and suspend() will race, so seems never hurts to double-
check.

2. Do I need to usb_set_intfdata(intf, NULL) in disconnect method and
in probe() function if registration with another subsystem fails?
Like:
static int usb_streamlabs_wdt_probe(struct usb_interface *intf,
                                        const struct usb_device_id *id)
{
	...
	usb_set_intfdata(intf, &data);
	...
	retval =3D devm_subsystem_register_device(&intf->dev, ...);
	if (retval) {
		dev_err(&intf->dev, "error message\n");
		usb_set_intfdata(intf, NULL)
		return retval;
	}
}

I saw some patches that clear stale dev->driver_data pointer in
disconnect but doesn't seem that all usb drivers do that hence the
question.

Thanks,
Alexey


