Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD5AD37728
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2019 16:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728954AbfFFOvb convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 6 Jun 2019 10:51:31 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.209]:57243 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728011AbfFFOva (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Jun 2019 10:51:30 -0400
Received: from [67.219.251.53] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-c.us-west-2.aws.symcld.net id 92/4D-22293-17829FC5; Thu, 06 Jun 2019 14:51:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEKsWRWlGSWpSXmKPExsXi5LtOQLdA42e
  MwYs91hbNi9ezWSxa1spsMfXvTUYHZo+ds+6ye+yfu4bd4/MmuQDmKNbMvKT8igTWjOcHdzEX
  3GCuuHJxPWsD42+mLkYuDiGBPYwSd75uZuxi5ORgEzCUOLflLTuILSKgIfHy6C0WEJtZwE/i0
  5FuVhBbWEBOYtmc/UA1HEA18hIvHkVBlFtJ9B9sAytnEVCR+PPzD1g5r4C1RMOhRjBbSCBe4s
  eRTWwgNqeAvsT2TxPAbEYBMYnvp9YwQawSl7j1ZD6YLSEgILFkz3lmCFtU4uXjf6wQtoJE84K
  F7BD1OhILdn9ig7DNJT5dPssKYWtLLFv4mhniBkGJkzOfsExgFJmFZMUsJO2zkLTPQtI+C0n7
  AkbWVYzmSUWZ6RkluYmZObqGBga6hoZGuobGlkC2XmKVbrJeabFueWpxia6RXmJ5sV5xZW5yT
  opeXmrJJkZgxKUUdHPtYHx35LXeIUZJDiYlUd57S37ECPEl5adUZiQWZ8QXleakFh9ilOHgUJ
  LgzVb7GSMkWJSanlqRlpkDjH6YtAQHj5IIb5c6UJq3uCAxtzgzHSJ1itGYY8LLuYuYORZsXbK
  IWYglLz8vVUqcdzLIJAGQ0ozSPLhBsKR0iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwbyLI
  Qp7MvBK4fa+ATmECOoX/wjeQU0oSEVJSDUzp5ZvSi38evDGxRuTEufPrJq8TLdQIeJySwTTxQ
  K79bZX8721TFHTCHO+wuCqsOnZsJz9LUUR+b7StZD7Lhb/ON5UtxJf/fuv5cOLx5Xt4hWvn7n
  xhKjwrt0ozVnT+4v9WYSfVFq6fc+ua9oSnMw8fvr956bryd5d9f3wV6hGxD2qXl9LedT5JrnL
  eqdw03pSStz+2O3NXfCnUDZDcFqpsYnv9XvDK9u0yf2cmP1dmWCD4tnTXdKdCtkXhth1ZaabV
  WVOeRvOWRK1cNNk5I+g8a3NFyaqY1lhFAY7EQ9qHp5ZwLxKsNHhvHrgrpKx9fe4GDfUKvYZFu
  m5hH1Y77YvWSF7q0qfoa9v8V6rohhJLcUaioRZzUXEiACnhpETFAwAA
X-Env-Sender: Seth.Bollinger@digi.com
X-Msg-Ref: server-2.tower-365.messagelabs.com!1559832685!12192439!4
X-Originating-IP: [66.77.174.16]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3292 invoked from network); 6 Jun 2019 14:51:28 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
  by server-2.tower-365.messagelabs.com with SMTP; 6 Jun 2019 14:51:28 -0000
Received: from MTK-SMS-XCH01.digi.com ([fe80::cca7:5299:c88e:1c40]) by
 MCL-VMS-XCH01.digi.com ([fe80::5587:821d:f8e4:6578%13]) with mapi id
 14.03.0439.000; Thu, 6 Jun 2019 09:51:27 -0500
From:   "Bollinger, Seth" <Seth.Bollinger@digi.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     USB list <linux-usb@vger.kernel.org>,
        Seth Bollinger <seth.boll@gmail.com>
Subject: Re: USB reset problem
Thread-Topic: USB reset problem
Thread-Index: AQHVHG+E/DdiSC3Fxkmu3GrMhR5lsKaPBVcAgAAEMwA=
Date:   Thu, 6 Jun 2019 14:51:26 +0000
Message-ID: <76055429-9E4E-4B4B-B9B0-9514F633392F@digi.com>
References: <A2655C7A-C29C-4462-A668-8F7B9C81A648@digi.com>
 <20190606143616.GB11294@kroah.com>
In-Reply-To: <20190606143616.GB11294@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.1.153]
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A4C214BDC5B2A24F86F59A9A345FC21B@digi.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


> On Jun 6, 2019, at 9:36 AM, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> If the descriptor changes between resets, that means that something
> changed and we need to start over with it.  What is the problem that
> this is causing

We have code doing a USBDEVFS_RESET that fails when the ioctl returns EPERM.

I think the solution might be to simply not do the reset for this device, but wanted to check if anyone else had encountered this issue.

Thanks!

Seth


