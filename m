Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E51242955E
	for <lists+linux-usb@lfdr.de>; Mon, 11 Oct 2021 19:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233299AbhJKRQ5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Oct 2021 13:16:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:51564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233793AbhJKRQv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 Oct 2021 13:16:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2AF2360240;
        Mon, 11 Oct 2021 17:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1633972491;
        bh=efxuo4d7g0IuwgpbO3HJqN9YgOmD7RVgQMEjeNVkMaY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IvQNcbBrvgkHyQMvnGJ7DO4EXHxG2Zh9T/EyK5aRDl5DjJFKiP6+13YBX+/YfkeA/
         8ATwKwnRv4xup/eX74FTflHsNuNd14wVIUkmQBoIRV0mscOZzYsRVfUfhoTz212GKW
         aanyT1jkYYLRgPm0zWwgKTsFO2MnPBdm66YBwf/o=
Date:   Mon, 11 Oct 2021 19:14:49 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mohammed Eleffendi <meleffendi@avidyne.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Updated xHCI Specification Document
Message-ID: <YWRxCXReyUTOpPQI@kroah.com>
References: <MW4PR03MB644372563D57A25130321234DAB59@MW4PR03MB6443.namprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MW4PR03MB644372563D57A25130321234DAB59@MW4PR03MB6443.namprd03.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 11, 2021 at 04:16:20PM +0000, Mohammed Eleffendi wrote:
> Hi, We are implementing a bare-metal driver for the USB xHCI
> controller on Tiger Lake UP3 and need a programming guide/Requirement
> Reference document. The one publicly available, which has Rev 1.2 is
> outdated.

Then contact Intel about this, as this doesn't seem to have much to do
with Linux.

Why not just use Linux instead?

good luck!

greg k-h
