Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 629B5156855
	for <lists+linux-usb@lfdr.de>; Sun,  9 Feb 2020 02:37:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727532AbgBIBhe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 Feb 2020 20:37:34 -0500
Received: from mail02.vodafone.es ([217.130.24.81]:59379 "EHLO
        mail02.vodafone.es" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727073AbgBIBhe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 8 Feb 2020 20:37:34 -0500
IronPort-SDR: q43fNqDLZe17D7tpApm038vCJgNB03RjqeBcXo2PdCDIos+1/tw0AOoFTipzqE/tJJbWBvXS/v
 pZmaiHDujJTg==
IronPort-PHdr: =?us-ascii?q?9a23=3AVK0rBxAWJpPz3wY8dVG5UyQJP3N1i/DPJgcQr6?=
 =?us-ascii?q?AfoPdwSPT5pMbcNUDSrc9gkEXOFd2Cra4d16yL4+u7ACRAuc/H7ClZNsQUFl?=
 =?us-ascii?q?cssoY/p0QYGsmLCEn2frbBThcRO4B8bmJj5GyxKkNPGczzNBX4q3y26iMOSF?=
 =?us-ascii?q?2kbVImbuv6FZTPgMupyuu854PcYxlShDq6fLh+MAi6oR/eu8ULjoZuMKY8xx?=
 =?us-ascii?q?jGrnZGZuhd2GdkKU6Okxrm6cq84ZBu/z5Mt/498sJLTLn3cbk/QbFEFjotLn?=
 =?us-ascii?q?o75NfstRnNTAuP4mUTX2ALmRdWAAbL8Q/3UI7pviT1quRy1i+aPdbrTb8vQj?=
 =?us-ascii?q?St871rSB7zhygZMTMy7XzahdZxjKJfpxKhugB/zovJa4ybKPZyYqXQds4cSG?=
 =?us-ascii?q?FcXMheSjZBD5uyYYUPFeoPI+VWoZTyqFQSohWzHhWsCeHzxTNUmnP6wbM23u?=
 =?us-ascii?q?I8Gg/GxgwgGNcOvWzOotrrKKcdT/q1x7TIwjXEafNW1ir25Y/Qch8/vfGDQ6?=
 =?us-ascii?q?hwcMTWyUkpGAPIlU6fqYv4MDyP1+UNtG6b4PR6We2zjG4nrhh8rz6yzckvko?=
 =?us-ascii?q?nEnpwZxk3G+Clj3Yo4K8G0RFRlbdOrCpdduSGXOo1rSc04WW5oojw1yrgetJ?=
 =?us-ascii?q?6+eygF1YooygbEa/yCb4iI+hXjVPuNITtghHJqZra/hxGq/Eil0OL8V8200E?=
 =?us-ascii?q?xUoSpBjtXBuWoB1wLU6seaUPR98ECh2TCR2AzJ9O5EOlg4lavdK5E/3r49jo?=
 =?us-ascii?q?QfvVnBEyPshUn7grOael869uWn8ejqbLXrqoeZN4BuiwH+Nqoumta4AeQ9Kg?=
 =?us-ascii?q?UOR3aU+fii273580z5R7NKjvItn6bCt5DVON4Up6++Aw9TzIkv8QqwDzCj0N?=
 =?us-ascii?q?gAh3kIMEpFeA6bj4juI1zOJPH4DfGig1WjiTtr2uvGMab6D5XTIXjMjq3hca?=
 =?us-ascii?q?x+60FC0gozy85Q55ZOBrEGOvLzVRy5iNuNCh4/Lhzx3v3tIMty25lYWm+VBK?=
 =?us-ascii?q?KddqTIvgyy6/orMtWLMbcYpDvnY8ci4fGm2Wc0hVIHYq6v0psMYnu4HdxpJk?=
 =?us-ascii?q?yYZTznhdJXQkkQuQ9rdOH2hUfKbjlVaD7mR68g6yskD4SpJY3ESom/h7qMmi?=
 =?us-ascii?q?y8G8sFNSh9FlmQHCKwJM2/UPAWZXfKLw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2F5cgD4YT9emCMYgtlmHQEBAQkBEQU?=
 =?us-ascii?q?FAYF7AgGBPQKBVlINExKMZIZxgU0fg0OLaIEAgzOGCBOBZw0BAQEBATUCAQG?=
 =?us-ascii?q?EQIJGJDwCDQIDDQEBBQEBAQEBBQQBAQIQAQEBAQEICwsGKYVKQgEMAYFrIoN?=
 =?us-ascii?q?wIA85SkwBDgGDV4JLAQEzrloNDQKFHoJgBAqBCIEbI4E2AgEBjCEagUE/gSM?=
 =?us-ascii?q?hgisIAYIBgn8BEgFugkiCWQSNUBIhiT+YMIJEBHiVa4I4AQ+IEYQ1A4JYD4E?=
 =?us-ascii?q?Lgx2DCIFnhFKBfp9YhBJXgSBzcTMaI4IdgSBPGA2ON44rAkCBFxACT4Q7hja?=
 =?us-ascii?q?CMgEB?=
X-IPAS-Result: =?us-ascii?q?A2F5cgD4YT9emCMYgtlmHQEBAQkBEQUFAYF7AgGBPQKBV?=
 =?us-ascii?q?lINExKMZIZxgU0fg0OLaIEAgzOGCBOBZw0BAQEBATUCAQGEQIJGJDwCDQIDD?=
 =?us-ascii?q?QEBBQEBAQEBBQQBAQIQAQEBAQEICwsGKYVKQgEMAYFrIoNwIA85SkwBDgGDV?=
 =?us-ascii?q?4JLAQEzrloNDQKFHoJgBAqBCIEbI4E2AgEBjCEagUE/gSMhgisIAYIBgn8BE?=
 =?us-ascii?q?gFugkiCWQSNUBIhiT+YMIJEBHiVa4I4AQ+IEYQ1A4JYD4ELgx2DCIFnhFKBf?=
 =?us-ascii?q?p9YhBJXgSBzcTMaI4IdgSBPGA2ON44rAkCBFxACT4Q7hjaCMgEB?=
X-IronPort-AV: E=Sophos;i="5.70,419,1574118000"; 
   d="scan'208";a="334344917"
Received: from mailrel04.vodafone.es ([217.130.24.35])
  by mail02.vodafone.es with ESMTP; 09 Feb 2020 02:37:08 +0100
Received: (qmail 8106 invoked from network); 9 Feb 2020 00:49:08 -0000
Received: from unknown (HELO 192.168.1.163) (apamar@[217.217.179.17])
          (envelope-sender <peterwong@bodazone.com>)
          by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
          for <linux-usb@vger.kernel.org>; 9 Feb 2020 00:49:08 -0000
Date:   Sun, 9 Feb 2020 01:49:07 +0100 (CET)
From:   Peter Wong <peterwong@bodazone.com>
Reply-To: Peter Wong <peterwonghsbchk@gmail.com>
To:     linux-usb@vger.kernel.org
Message-ID: <1551295.233608.1581209348789.JavaMail.cash@217.130.24.55>
Subject: Investment opportunity
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greetings,
Please check the attached email for a buisness proposal to explore.
Looking forward to hearing from you for more details.
Sincerely: Peter Wong




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.

