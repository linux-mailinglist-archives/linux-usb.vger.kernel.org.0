Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B079133C62
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jun 2019 02:24:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbfFDAYO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Jun 2019 20:24:14 -0400
Received: from mail-pf1-f182.google.com ([209.85.210.182]:40194 "EHLO
        mail-pf1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726136AbfFDAYO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Jun 2019 20:24:14 -0400
Received: by mail-pf1-f182.google.com with SMTP id u17so11551955pfn.7
        for <linux-usb@vger.kernel.org>; Mon, 03 Jun 2019 17:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=F1fjj8SveI53Eh/TKWeZR5XNIAmDY/eqo7786zDDH6E=;
        b=fDIAyfS1O3fMyLa/9KziLq9/krKzkIPYmDD8dCINlJ7Py8k3kmh2fq/4w/SIDCJYd8
         Sv33DKJ/L7aPq0OAVWLrlzSpIeWwDR1XXwlG/gfdh3Mi9qT49QWr3C9xirb8Zbdpbp4o
         yMVzpmShYmceP3HppmCzPc5rW4hPLRIrQRh6SgDzWX/sV8aNTD1lM1lYH8Y/xSmGspA+
         nHnPmq9D+pM04mbTRR3lmSn0vZMZtgIIDB82bbwffRnmJOnAOGaDda15iVAhgfwuFDr0
         RAO9oQ9iMJaZ0ccgvWqGTADOhUmoe/7FJZ8PpdK/Mw9t2Z4YVC4HIu7989yjobVyzsT2
         0kXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=F1fjj8SveI53Eh/TKWeZR5XNIAmDY/eqo7786zDDH6E=;
        b=awOPJiURLSAk6pzui37UgJB1ZlhEIRTBwyHQS0NQwuagg9Q8Do3LJQ3hIrfBWkp1qm
         PR1g7M73qGKDy6YbxApsD7Qs5epXzSmFVPHs3zf2FqrQ8qiuBj3biyhoIriQCysD8S5Y
         432eLH3jXF27gWnPJtaZKfK1Rql9BAkzIr4O/rAmLN7sDgTxq+lPTxErDDU0chH619q8
         3gKzJlFWfC3sDbbsL1Z2EcrJ/UP8LNYixj/d4dkLO2E5YVPsyzmJxPPSerCBk8Wl4Uxq
         yOA27O2XLeDsQ5yGPAPifLFrlsERBM5Zj6JC3YEaOQlIp3XsKYMVI9kfPXutp9UiE4sN
         0KLg==
X-Gm-Message-State: APjAAAUomCReNjq8nfg3JJScwvRxss484GzBgeKXq6LnhzRtyFscyv6m
        KB5T7s5LpHDE4olHGo6mK68=
X-Google-Smtp-Source: APXvYqzT/qPYc4ApVdGuiXEBEnCO19xiPvOdUchFQ7QNXJW1Ml2IR/+OzhM/HjAeVr2c2lxMzcxNGw==
X-Received: by 2002:a62:60c2:: with SMTP id u185mr24620877pfb.58.1559607853256;
        Mon, 03 Jun 2019 17:24:13 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id f16sm16517429pja.18.2019.06.03.17.24.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jun 2019 17:24:12 -0700 (PDT)
Date:   Mon, 3 Jun 2019 17:24:10 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Extending USB_CONNECTINFO ioctl
Message-ID: <20190604002410.GA36666@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan, Greg,

When running software in a jailed environment where sysfs or udev is not
readily available and one can only have an FD to usbdevfs device passed
into the jail, there is a desire to allow libusb working. Alan recently
added USBDEVFS_GET_SPEED, but we are still missing bus number and list
of port numbers on the way to the root to be able to better identify the
device in question.

What do you think about adding a new ioctl:

struct usbdevfs_connectinfo_ex {
	__u32 size;		/* size of the structure from the kernel POV */
	__u32 busnum;
	__u32 devnum;
	__u32 speed;		/* USB_SPEED_* form ch9.h */
	u8 num_ports;		/* Number of entries in port_numbers array */
	u8 port_numbers[31];	/* Current limit in USB3.0 spec is 7 */
};

/*
 * Returns struct usbdevfs_connectinfo_ex; length is variable to allow
 * extending size of the data returned.
 */
#define USBDEVFS_CONNINFO_EX(len)  _IOC(_IOC_READ, 'U', 32, len)

Thanks.

-- 
Dmitry
