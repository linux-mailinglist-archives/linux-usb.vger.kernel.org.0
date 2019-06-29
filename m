Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66A975AD56
	for <lists+linux-usb@lfdr.de>; Sat, 29 Jun 2019 22:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbfF2U0M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 29 Jun 2019 16:26:12 -0400
Received: from mail-ed1-f48.google.com ([209.85.208.48]:39222 "EHLO
        mail-ed1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726909AbfF2U0M (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 29 Jun 2019 16:26:12 -0400
Received: by mail-ed1-f48.google.com with SMTP id m10so16668755edv.6
        for <linux-usb@vger.kernel.org>; Sat, 29 Jun 2019 13:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=W4YaRX8EFf5ho9bnusaVvRQSnMJ5ux8F4WWcpUTPgaI=;
        b=YUnbpfSWXr74XBw2M4RqMKa3/+KqoGTtccj5fTOH71UQs6x2fKInROeKm0QDMLEqW3
         0oKSFsIV/WTeeeFntQvj9wvMrsaM1j4JxL6DHqv0HX5KryYDhI2Sh/e0iYt4APpy8sm0
         t1GsyEVib64IQe8ByipKIbB45ADOLRhEeinA7Z1GAxGXRWtBr5GD/qgQVkULq5aVenl6
         Ygrg7tk/ouHWv+0ALxjAXoN4rOburigP7CBcBNUFAZ2t4xnH1yy3XQjoDqbtQTeVefcH
         MWhSb7f3wNAumjpQIPnZ5rXYA1WLin0L6dWsJReR220z+Kv9+97t3C+m2bzckf4YXyHl
         Gd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=W4YaRX8EFf5ho9bnusaVvRQSnMJ5ux8F4WWcpUTPgaI=;
        b=rgJ50+AGiqxUepSVtVlW7ngiIt4vfeG/uFYlnrsMqPkWU7TzYbrW/ZTiRfn12mawM1
         qslX0PFScsyWfkCWimgGaMl++QuD2udzMA7/F30349KPvEl4Qr1SuKTKhkwBdoRehgzH
         0W7OnEoTuA3q8OOicZ9gK4gLrYmEc8TxBVpKtNPxL2Pb27ka2rIGi5Qw1D7pF2BsGiHs
         N2Ulg4CWwO9CXhf8NNRdhqEpLnDcO4/mKFYV7+lJG6wVYiEAidVvr9d5E+EFFfOm39DS
         NSRnOqFpJRNVSJ9rGBcFSvN194XaRUgvsg/2IFUObayDe2796jETbNjvT9IoIyIenwA8
         57yw==
X-Gm-Message-State: APjAAAXwSeMNw5rJQ80Qk2mxsRjbAv2fHj8QVehz7quFBfaftEICnS8D
        OsEHLrjcphkEDLrXREHrG2I=
X-Google-Smtp-Source: APXvYqw1nQisMvZ314D6KJhif0Kr5s0CWGDNw8Lekt4fKyinNN1eTwJ8ldT7cLpPRhI5JhP41e9kyA==
X-Received: by 2002:a17:906:edd7:: with SMTP id sb23mr5619278ejb.309.1561839970564;
        Sat, 29 Jun 2019 13:26:10 -0700 (PDT)
Received: from [192.168.1.60] (0126800801.0.fullrate.ninja. [2.110.44.75])
        by smtp.gmail.com with ESMTPSA id y9sm952974eds.15.2019.06.29.13.26.09
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 29 Jun 2019 13:26:09 -0700 (PDT)
Message-ID: <6dbe8df06875947d7ea6d6a21f83ac68315c0ef4.camel@gmail.com>
Subject: Clarification of set_sel handling when dwc3 is a device (gadget)
From:   claus.stovgaard@gmail.com
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     linux-usb@vger.kernel.org, v.anuragkumar@gmail.com,
        Rob Weber <rob@gnarbox.com>
Date:   Sat, 29 Jun 2019 22:26:08 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

I have earlier worked with the possibility for disabling U1/U2 to solve
an issue where the dwc3 acting as a gadget device sometimes failing to
leave U2.

Analyzing the situation when the dwc3 failing to leave U2, it happens
when the link is in U2 after timeout from U1, and when the device wants
to leave U2. Not when the host wants to leave U2.

Going back the BOS descriptor from the device reports

bU1DevExitLat 1us
bU2DevExitLat 500us

And the SetSystemExitLatency control transfer ends with

U1 System Exit Latency 86 us
U1 Device to Host Exit Latency 1 us
U2 System Exit Latency 585 us
U2 Device to Host Exit Latency 500 us

Looking at the length of LFPS etc. it seems that the U2 exit is just
above 80 us,and it start link training just after.

So I was wandering how the exit latency of the system is communicated
to dwc3 core, and found the following code from ep0.c
dwc3_ep0_set_sel_cmpl

----
reg = dwc3_readl(dwc->regs, DWC3_DCTL);
if (reg & DWC3_DCTL_INITU2ENA)
	param = dwc->u2pel;
if (reg & DWC3_DCTL_INITU1ENA)
	param = dwc->u1pel;

/*
 * According to Synopsys Databook, if parameter is
 * greater than 125, a value of zero should be
 * programmed in the register.
 */
if (param > 125)
	param = 0;

/* now that we have the time, issue DGCMD Set Sel */
ret = dwc3_send_gadget_generic_command(dwc,
		DWC3_DGCMD_SET_PERIODIC_PAR, param);
WARN_ON(ret < 0);
----

I don't have access to Synopsys Databook, so I am puzzled about
the DWC3_DGCMD_SET_PERIODIC_PAR command. The code favor to use the
device to host exit latency, and use the u1 if present over the u2.

So the dwc3 core never get the system exit latency times, and they just
disapeer.

I hope that someone have access to the Databook, and is able to share
some details about the set periodic command and the parameter.

Regards
Claus


